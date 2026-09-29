## Scripts overview

Everything below reads/writes `models-inventory.json`, the single source of
truth for what local GGUF models exist and which backends (llama.cpp router,
LM Studio, ik_llama.cpp) have actually been confirmed to load and run each
one. Status values (`working` / `rejected` / `untested` / `not_configured`)
are only ever set from a real test -- never inferred from a model being
listed somewhere.

### Router-mode setup (llama.cpp, port 11454)

*   `build-router-models-dir.sh` -- scans `~/.lmstudio/models`,
    `~/.ollama/models`, `~/.cache/huggingface`, `~/.omlx/models` for `*.gguf`
    files and generates a one-level symlink farm at
    `~/.cache/llama-router-models/` (named `<org>__<repo>`). Router mode's
    `--models-dir` scan is **not recursive past one level**, so the real
    two-level `org/repo/file.gguf` caches must be flattened first. Also
    auto-pairs `mmproj-*.gguf`, auto-detects multipart shards
    (`-00001-of-000NN.gguf`), and splits distinct same-folder quantizations
    into individual file symlinks. Re-run after downloading new models.
*   `serve-router.sh` -- rebuilds the farm, then launches `llama-server`
    with **no `--model`** (router mode: loads/unloads models on demand per
    request, `--models-max` LRU-evicts). Env overrides:
    `LLAMA_CPP_MODELS_DIR`, `LLAMA_CPP_MODELS_MAX` (default 1),
    `LLAMA_CPP_CTX_SIZE` (default 32768).

### Single-model launchers (predate router mode; still useful for a pinned,
tuned config instead of the router's generic defaults)

*   `serve.sh` -- thin wrapper, currently sources `serve-Qwen3.6-35B-A3B.sh`.
*   `serve-Qwen3.6-35B-A3B.sh`, `serve-Qwen3.8-27B.sh` -- fixed single-model
    launches with hand-tuned flags (temp, top-p/top-k, flash-attn, jinja
    template).
*   `set-system-prompt.sh` -- helper for setting a system prompt.

### Test tooling (per-model load/inference verification)

*   `mem-watchdog.sh LOG PID [MAX_CHECKS]` -- generic macOS memory-pressure
    killswitch. Polls `kern.memorystatus_vm_pressure_level` every 10s, kills
    the watched PID (and children) after 2 consecutive "critical" readings.
    Used by every batch test below as a safety net for large-model loads.
*   `test-model-load.sh MODEL_ID [PORT] [TIMEOUT_S] [ENDPOINT_PATH]` -- one
    small chat completion against an already-running server. Reports
    `load_time_s` (isolated from inference), `total_elapsed_s`,
    `prompt_tokens_per_second`, `gen_tokens_per_second`. `ENDPOINT_PATH`
    defaults to `/v1/chat/completions` (llama.cpp/ik_llama.cpp, response has
    a `timings` object). **For LM Studio, pass `/api/v0/chat/completions`**
    -- its OpenAI-compat `/v1` endpoint returns an always-empty `"stats": {}`,
    but the native `/api/v0` endpoint (same request body) populates
    `stats.tokens_per_second` / `time_to_first_token` / `generation_time`,
    which the script converts to the same `load_time_s`/tok-per-s fields.
*   `test-audio-model-load.sh MODEL_ID [PORT] [TIMEOUT_S]` -- sends
    `test-fixtures/test-audio.wav` to `/v1/audio/transcriptions`
    (multipart/form-data, OpenAI Whisper-compatible shape) for ASR models.
    The response has no timings breakdown, so this fires the request twice
    (cold then warm) and derives `load_time_s`/`gen_tokens_per_second` from
    the difference -- same isolation idea as the chat-completions testers,
    just without a server-reported number to lean on. `prompt_tokens_per_second`
    stays `n/a`: audio input isn't measured in text-prompt tokens.
*   `test-vision-model-load.sh MODEL_ID [PORT] [TIMEOUT_S] [ENDPOINT_PATH]`
    -- sends `test-fixtures/test-image.png` via chat completions +
    `image_url` (base64 data URL) for OCR/vision models. Same
    `ENDPOINT_PATH`/LM Studio note as `test-model-load.sh` above.
*   `test-inventory-models.sh [--mode text|audio|vision] [--external-port PORT] [--endpoint-path PATH] RESULTS_JSONL MODEL_ID [MODEL_ID...]`
    -- batch driver for the **llama.cpp router**: starts the router +
    watchdog once, loops the matching tester above over every model id
    (router's `--models-max 1` LRU-evicts between tests, no restart
    needed), tears down after. With `--external-port` (e.g. `11444` for LM
    Studio), skips starting/stopping anything and just loops the tests
    against that already-running server -- pair with
    `--endpoint-path /api/v0/chat/completions` for LM Studio to get real
    tok/s numbers instead of nulls.
*   `test-ik-llama-cpp-models.sh [--mode text|audio|vision] RESULTS_JSONL MODEL_ID [MODEL_ID...]`
    -- batch driver for **ik_llama.cpp**, which has no router mode: resolves
    each model id's real file path from `models-inventory.json`, then does a
    full launch → poll-ready → test → kill cycle per model (with its own
    watchdog per launch).
*   `test-fixtures/` -- `test-audio.wav` ("Hello, this is a test.", made via
    macOS `say`+`afconvert`) and `test-image.png` (rendered text "HELLO OCR
    TEST 12345", made via `qlmanage -t` on a `.txt` file).

### Inventory management

*   `models-inventory.json` -- the master file. Each model entry has
    `id`/`source_dir`/`model_file`/`mmproj_file`/`multipart`/`size_on_disk`
    plus a `backends` object with one entry per backend
    (`llama_cpp_router`, `lm_studio`, `ik_llama_cpp`), each carrying
    `status`, perf fields (`load_time_s`, `total_elapsed_s`,
    `prompt_tokens_per_second`, `gen_tokens_per_second`), modality-specific
    fields (`transcribed_text`/`input_tokens`/`output_tokens` for audio,
    `ocr_text` for vision), `notes`, `tested_at`.
*   `merge-test-results.py RESULTS_JSONL [--backend NAME] [--id-map MAPPING_JSON] [--date YYYY-MM-DD]`
    -- merges a batch driver's JSONL output into `models-inventory.json`.
    `--backend` picks which `backends.<name>` to write (default
    `llama_cpp_router`). `--id-map` is needed when the tested backend's own
    model ids differ from the inventory's canonical `org__repo` ids (e.g.
    LM Studio's catalog ids) -- a JSON object `{inventory_id: tested_id}`.
*   `split-inventory.py` -- derives 5 per-category files
    (`models-inventory.general-chat.json`, `.code.json`, `.ocr.json`,
    `.speech_asr_tts.json`, `.embeddings.json`) from the master, for faster
    special-purpose loading. Re-run after any master-file change; never
    hand-edit the split files, they're regenerated wholesale each time.
*   `render-inventory-table.py [--input FILE] [--category NAME] [--backends LIST] [--format table|markdown|json|yaml|csv] [--output FILE] [--sort none|id|size]`
    -- renders the master (or a split file) as a size + per-backend
    load-time/prompt-tok-s/gen-tok-s comparison table (box-drawing
    `--format table`, the default, or a GFM `--format markdown` table), or
    exports the same flattened rows as JSON, YAML, or CSV. Table legend: a
    real number = working; `OK`/`n/a` = working but that endpoint has no
    timing breakdown (e.g. audio transcription); `X` = tested and rejected;
    `-` = untested/not_configured. The "Model x backend results" table below
    is a snapshot from this script -- regenerate it after any inventory
    change with:
    `python3 render-inventory-table.py --format markdown --sort size`

## Model x backend results

Snapshot as of 2026-09-29. Regenerate with the command above; this table is
derived from `models-inventory.json`, never hand-edited.

| Model                                               | Size | Router Load | Router Prompt tok/s | Router Gen tok/s | LM Studio Load | LM Studio Prompt tok/s | LM Studio Gen tok/s | ik_llama.cpp Load | ik_llama.cpp Prompt tok/s | ik_llama.cpp Gen tok/s |
|-----------------------------------------------------|------|-------------|---------------------|------------------|----------------|------------------------|---------------------|-------------------|---------------------------|------------------------|
| FL33TW00D-HF__whisper-tiny                          | 144M | X           |                     |                  | -              |                        |                     | -                 |                           |                        |
| xkeyC__whisper-large-v3-turbo-gguf__model_q4_k      | 454M | X           |                     |                  | -              |                        |                     | -                 |                           |                        |
| xkeyC__whisper-large-v3-turbo-gguf__model_q4_1      | 501M | X           |                     |                  | -              |                        |                     | -                 |                           |                        |
| oxide-lab__whisper-large-v3-turbo-GGUF              | 825M | X           |                     |                  | -              |                        |                     | -                 |                           |                        |
| ggml-org__GLM-OCR-GGUF                              | 2.1G | 0.3s        | 1853.7              | 263.0            | 6.4s           | 1750.8                 | 257.4               | X                 |                           |                        |
| unslothai__Qwen3-ASR-1.7B-GGUF                      | 2.6G | 1.5s        | n/a                 | 137.5            | -              |                        |                     | -                 |                           |                        |
| vonjack__whisper-large-v3-gguf                      | 2.9G | X           |                     |                  | -              |                        |                     | -                 |                           |                        |
| ibm-granite__granite-speech-4.1-2b-plus-GGUF        | 4.1G | 1.9s        | n/a                 | 85.7             | -              |                        |                     | -                 |                           |                        |
| vokra__qwen3-asr-1.7b                               | 4.4G | X           |                     |                  | -              |                        |                     | -                 |                           |                        |
| ibm-granite__granite-speech-4.1-2b-GGUF             | 4.5G | 2.2s        | n/a                 | 85.7             | -              |                        |                     | -                 |                           |                        |
| lmstudio-community__olmOCR-2-7B-1025-GGUF           | 8.8G | 3.2s        | 413.6               | 57.1             | 3.5s           | 506.7                  | 55.9                | X                 |                           |                        |
| unsloth__Qwen3.6-35B-A3B-GGUF                       | 21G  | 7.7s        | 223.8               | 89.7             | 11.4s          | 172.8                  | 88.7                | 2.0s              | 187.4                     | 73.0                   |
| lmstudio-community__Qwen3.8-27B-GGUF                | 28G  | 11.5s       | 89.8                | 16.2             | 15.8s          | 80.3                   | 23.7                | 10.1s             | 38.1                      | 11.0                   |
| OBLITERATUS__Qwen3.8-27B-OBLITERATED                | 28G  | 11.3s       | 35.7                | 16.1             | 12.7s          | 28.4                   | 23.8                | 10.1s             | 38.9                      | 10.9                   |
| lmstudio-community__gemma-4-31B-it-GGUF             | 32G  | 13.0s       | 28.0                | 13.6             | 15.1s          | 27.7                   | 12.8                | 7.6s              | 38.7                      | 9.1                    |
| TheBloke__WizardCoder-Python-34B-V1.0-GGUF          | 33G  | 14.0s       | 136.3               | 13.5             | 16.1s          | 27.8                   | 13.4                | 14.1s             | 36.6                      | 8.7                    |
| lmstudio-community__Qwen3.6-35B-A3B-GGUF            | 35G  | 16.2s       | 180.0               | 80.8             | 21.6s          | 172.2                  | 79.0                | 11.6s             | 154.2                     | 70.2                   |
| unsloth__Qwen3.5-35B-A3B-GGUF                       | 38G  | 18.1s       | 108.2               | 66.8             | 17.2s          | 145.6                  | 65.2                | 14.1s             | 99.2                      | 45.4                   |
| mradermacher__OpenMath-CodeLlama-70b-Python-hf-GGUF | 45G  | 21.5s       | 61.4                | 9.3              | 23.1s          | 10.4                   | 8.7                 | 18.7s             | 11.9                      | 6.1                    |
| ggml-org__Qwen3.8-27B-GGUF                          | 51G  | 23.5s       | 85.1                | 9.2              | X              |                        |                     | 18.1s             | 17.0                      | 5.3                    |
| unsloth__Qwen3.8-27B-GGUF                           | 52G  | 22.4s       | 86.5                | 9.3              | X              |                        |                     | 18.1s             | 16.8                      | 5.3                    |
| unsloth__Qwen3-Coder-30B-A3B-Instruct-GGUF          | 57G  | 25.9s       | 152.8               | 59.8             | 30.5s          | 124.5                  | 58.9                | X                 |                           |                        |
| Kay6888__DeepSeek-Coder-V2-Lite-Instruct-GGUF       | 59G  | 25.4s       | 108.9               | 45.0             | 35.7s          | 108.5                  | 45.5                | X                 |                           |                        |
| unsloth__Qwen3.5-35B-A3B-Experiments-GGUF           | 65G  | 27.0s       | 151.1               | 58.6             | 31.9s          | 131.8                  | 57.4                | X                 |                           |                        |
| lmstudio-community__Qwen3-Coder-Next-GGUF           | 79G  | 43.7s       | 54.2                | 51.1             | 74.9s          | 12.3                   | 7.5                 | 26.2s             | 118.9                     | 58.6                   |

Legend: real value = working (with that number) | OK/n/a = working but this endpoint reports no timing breakdown (e.g. audio) | X = tested and rejected | - = untested/not_configured

*   https://docs.servicestack.net/ai-server/llama-server#access-llama-server-from-c

*   https://dev.to/avatsaev/pro-developers-guide-to-local-llms-with-llamacpp-qwen-coder-qwencode-on-linux-15h

*   https://www.reddit.com/r/LocalLLaMA/comments/1jxbba9/you_can_now_use_github_copilot_with_native/

*   https://www.reddit.com/r/LocalLLaMA/comments/1s8e6ie/how_do_you_start_your_llamacpp_server/

```shell
llama-server \
    --webui-mcp-proxy \
    --models-max 1 \
    --models-preset ./models.ini \
    --port 11454
```

```shell
# Qwen3.6-27B (UD-Q4_K_XL) -- top combo with `pi`: 16/16 at ~207 s/task
llama-server \
    -hf unsloth/Qwen3.6-27B-GGUF:UD-Q4_K_XL \
    --alias bench-model \
    --flash-attn on \
    --cache-type-k q8_0 \
    --cache-type-v q8_0 \
    --jinja -np 1 \
    --host 127.0.0.1 \
    --port 11454 \
    --ctx-size 131072 \
```

```shell
# gpt-oss-120b (MXFP4, 32k ctx) -- fastest 15/16 combo with `pi` (~34 s/task)
llama-server \
    -hf ggml-org/gpt-oss-120b-GGUF \
    --alias bench-model \
    --flash-attn on \
    --cache-type-k q8_0 \
    --cache-type-v q8_0 \
    --jinja -np 1 \
    --host 127.0.0.1 \
    --port 8001 \
    --ctx-size 32768 \
```


## Original


```shell
# Qwen3.6-27B (UD-Q4_K_XL) -- top combo with `pi`: 16/16 at ~207 s/task
llama-server -hf unsloth/Qwen3.6-27B-GGUF:UD-Q4_K_XL --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 131072 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja -np 1

# gpt-oss-120b (MXFP4, 32k ctx) -- fastest 15/16 combo with `pi` (~34 s/task)
llama-server -hf ggml-org/gpt-oss-120b-GGUF --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 32768 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja -np 1

# Qwen3.6-35B-A3B (MoE, 3B active, UD-Q4_K_XL) -- 15/16 with `qwen` at ~108 s/task
llama-server -hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-Q4_K_XL --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 131072 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja --chat-template-kwargs '{"enable_thinking":false}' -np 1

# gemma-4-26B-A4B-it (UD-Q4_K_XL) -- smallest 15/16 cell, with `opencode` (~307 s/task)
llama-server -hf unsloth/gemma-4-26B-A4B-it-GGUF:UD-Q4_K_XL --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 131072 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja -np 1

# gemma-4-31b-it (Q4_K_M, 65k ctx) -- 15/16 with `pi` at ~422 s/task
llama-server -hf unsloth/gemma-4-31b-it-GGUF:Q4_K_M --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 65536 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja -np 1
```