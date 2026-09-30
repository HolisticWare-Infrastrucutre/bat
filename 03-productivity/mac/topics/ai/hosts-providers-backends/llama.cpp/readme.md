## Scripts overview

Everything below reads/writes `models-inventory.json`, the single source of
truth for what local GGUF models exist and which backends (llama.cpp router,
LM Studio, ik_llama.cpp, mlx-serve) have actually been confirmed to load and
run each one. Status values (`working` / `rejected` / `untested` /
`not_configured`) are only ever set from a real test -- never inferred from
a model being listed somewhere.

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

### Router-mode setup (mlx-serve, port 11474)

*   `serve-mlx-serve.sh` -- rebuilds the same symlink farm router mode uses,
    then launches `mlx-serve --serve --model-dir ... --max-resident-models 1`
    (its own on-demand/LRU router mode). Reuses the farm as-is, so ids match
    the inventory's canonical `org__repo` ids with zero translation. Its
    `/v1/chat/completions` response uses the exact same `timings` shape
    llama.cpp does, so `test-model-load.sh`/`test-vision-model-load.sh` work
    against it completely unmodified -- just point `--external-port` at
    `11474` (see `test-inventory-models.sh` below). Two confirmed
    backend-level limitations (not per-model bugs): no
    `/v1/audio/transcriptions` route at all (404, not in its own printed
    route table -- `speech_asr_tts` entries stay `untested` for this
    backend, mirroring the LM Studio precedent), and `--model-dir`
    discovery does not auto-pair a model's mmproj/vision-tower file the way
    llama.cpp router's `--mmproj` auto-detection does (vision/OCR requests
    fail with "serving without its vision tower" even though the mmproj
    file sits right next to the model in the farm) -- both confirmed via a
    real full-batch test, not assumed. Env overrides: `MLX_SERVE_BIN`,
    `MLX_SERVE_PORT` (default 11474), `MLX_SERVE_MODELS_DIR`,
    `MLX_SERVE_MAX_RESIDENT` (default 1).

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
*   `context_probe.py` -- shared module (imported by all three testers below
    via the `TEST_HERE` env var on `sys.path`) that does a best-effort GET
    against the live server right after a successful test to read back
    `context_size` (the ctx the model was actually loaded with for that run)
    and `context_size_max` (the model's native/trained max context, when the
    backend's API exposes it). Tries `/v1/models` first (llama.cpp:
    `data[0].meta.n_ctx`/`n_ctx_train`; ik_llama.cpp:
    `data[0].max_model_len` + `data[0].meta.n_ctx_train`), then
    `/api/v0/models` (LM Studio: `max_context_length` always,
    `loaded_context_length` when present), then falls back to `/props`
    (`default_generation_settings.n_ctx`, loaded ctx only, no native max).
    Every value is read from a real response; a field just stays `null` when
    that backend's API doesn't expose it.
*   `test-model-load.sh MODEL_ID [PORT] [TIMEOUT_S] [ENDPOINT_PATH]` -- one
    small chat completion against an already-running server. Reports
    `load_time_s` (isolated from inference), `total_elapsed_s`,
    `prompt_tokens_per_second`, `gen_tokens_per_second`, `context_size`,
    `context_size_max` (the last two via `context_probe.py`). `ENDPOINT_PATH`
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
    Studio, or `11474` for `mlx-serve` started separately via
    `serve-mlx-serve.sh`), skips starting/stopping anything and just loops
    the tests against that already-running server -- pair with
    `--endpoint-path /api/v0/chat/completions` for LM Studio to get real
    tok/s numbers instead of nulls (mlx-serve needs no `--endpoint-path`
    override, its default `/v1/chat/completions` already matches
    llama.cpp's `timings` shape).
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
    (`llama_cpp_router`, `lm_studio`, `ik_llama_cpp`, `mlx_serve`), each carrying
    `status`, perf fields (`load_time_s`, `total_elapsed_s`,
    `prompt_tokens_per_second`, `gen_tokens_per_second`), context fields
    (`context_size` -- ctx actually loaded with for that test run;
    `context_size_max` -- model's native/trained max context, when the
    backend's API exposes it; both `null` until a test run populates them --
    see `context_probe.py` above), modality-specific fields
    (`transcribed_text`/`input_tokens`/`output_tokens` for audio, `ocr_text`
    for vision), `notes`, `tested_at`.
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
    exports the same flattened rows as JSON, YAML, or CSV -- the JSON/YAML/CSV
    exports also carry each backend's `context_size`/`context_size_max`
    (not shown in the table/markdown views, to keep those columns fixed on
    speed comparison). Table legend: a
    real number = working; `OK`/`n/a` = working but that endpoint has no
    timing breakdown (e.g. audio transcription); `X` = tested and rejected;
    `-` = untested/not_configured. The "Model x backend results" table below
    is a snapshot from this script -- regenerate it after any inventory
    change with:
    `python3 render-inventory-table.py --format markdown --sort size`

## Model x backend results

Snapshot as of 2026-09-29 (router/LM Studio/ik_llama.cpp re-tested twice: an
initial pass hit unrelated heavy CPU contention that tanked ik_llama.cpp's
numbers specifically, then a full re-test on a quiet system produced this
clean pass -- see git history if the contention-affected numbers are ever
needed for comparison; mlx-serve added as a 4th backend in the same session,
first-pass baseline). Regenerate with the command above; this table is
derived from `models-inventory.json`, never hand-edited.

| Model                                               | Size | Router Load | Router Prompt tok/s | Router Gen tok/s | LM Studio Load | LM Studio Prompt tok/s | LM Studio Gen tok/s | ik_llama.cpp Load | ik_llama.cpp Prompt tok/s | ik_llama.cpp Gen tok/s | mlx-serve Load | mlx-serve Prompt tok/s | mlx-serve Gen tok/s |
|-----------------------------------------------------|------|-------------|---------------------|------------------|----------------|------------------------|---------------------|-------------------|---------------------------|------------------------|----------------|------------------------|---------------------|
| FL33TW00D-HF__whisper-tiny                          | 144M | X           |                     |                  | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| xkeyC__whisper-large-v3-turbo-gguf__model_q4_k      | 454M | X           |                     |                  | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| xkeyC__whisper-large-v3-turbo-gguf__model_q4_1      | 501M | X           |                     |                  | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| oxide-lab__whisper-large-v3-turbo-GGUF              | 825M | X           |                     |                  | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| ggml-org__GLM-OCR-GGUF                              | 2.1G | 0.9s        | 1733.8              | 256.8            | 6.7s           | 1622.8                 | 268.2               | X                 |                           |                        | X              |                        |                     |
| unslothai__Qwen3-ASR-1.7B-GGUF                      | 2.6G | 1.3s        | n/a                 | 137.5            | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| vonjack__whisper-large-v3-gguf                      | 2.9G | X           |                     |                  | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| ibm-granite__granite-speech-4.1-2b-plus-GGUF        | 4.1G | 1.8s        | n/a                 | 85.7             | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| vokra__qwen3-asr-1.7b                               | 4.4G | X           |                     |                  | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| ibm-granite__granite-speech-4.1-2b-GGUF             | 4.5G | 1.8s        | n/a                 | 85.7             | -              |                        |                     | -                 |                           |                        | -              |                        |                     |
| lmstudio-community__olmOCR-2-7B-1025-GGUF           | 8.8G | 3.2s        | 505.7               | 56.5             | 3.4s           | 504.6                  | 57.0                | X                 |                           |                        | X              |                        |                     |
| unsloth__Qwen3.6-35B-A3B-GGUF                       | 21G  | 7.9s        | 226.6               | 95.7             | 11.6s          | 205.9                  | 83.5                | 6.4s              | 236.6                     | 66.6                   | 0.9s           | 489.7                  | 54.4                |
| lmstudio-community__Qwen3.8-27B-GGUF                | 28G  | 12.1s       | 89.5                | 16.1             | 15.3s          | 77.9                   | 23.7                | 10.1s             | 54.0                      | 10.9                   | 10.8s          | 146.1                  | 12.9                |
| OBLITERATUS__Qwen3.8-27B-OBLITERATED                | 28G  | 11.4s       | 35.6                | 16.1             | 14.3s          | 29.9                   | 23.7                | 10.1s             | 36.7                      | 10.9                   | 10.3s          | 177.6                  | 12.9                |
| lmstudio-community__gemma-4-31B-it-GGUF             | 32G  | 13.6s       | 28.1                | 13.7             | 16.5s          | 27.8                   | 14.1                | 10.8s             | 38.2                      | 9.1                    | 11.9s          | 26.4                   | 11.8                |
| TheBloke__WizardCoder-Python-34B-V1.0-GGUF          | 33G  | 13.7s       | 136.3               | 13.5             | 16.6s          | 27.7                   | 13.7                | 11.4s             | 36.7                      | 8.7                    | 12.1s          | 184.0                  | 11.1                |
| lmstudio-community__Qwen3.6-35B-A3B-GGUF            | 35G  | 14.8s       | 183.9               | 81.6             | 21.9s          | 141.8                  | 78.2                | 14.1s             | 153.4                     | 68.8                   | 13.6s          | 436.4                  | 45.0                |
| unsloth__Qwen3.5-35B-A3B-GGUF                       | 38G  | 12.2s       | 183.3               | 67.6             | 18.0s          | 137.3                  | 64.0                | 14.1s             | 112.7                     | 44.6                   | 10.8s          | 162.4                  | 38.8                |
| mradermacher__OpenMath-CodeLlama-70b-Python-hf-GGUF | 45G  | 19.9s       | 61.6                | 9.3              | 21.7s          | 10.4                   | 9.0                 | 14.5s             | 11.2                      | 6.0                    | 19.0s          | 121.6                  | 6.7                 |
| ggml-org__Qwen3.8-27B-GGUF                          | 51G  | 22.1s       | 85.9                | 9.3              | X              |                        |                     | 19.5s             | 21.8                      | 5.3                    | 20.6s          | 240.3                  | 7.5                 |
| unsloth__Qwen3.8-27B-GGUF                           | 52G  | 21.6s       | 86.3                | 9.3              | X              |                        |                     | 18.1s             | 20.0                      | 5.3                    | 20.3s          | 242.6                  | 7.3                 |
| unsloth__Qwen3-Coder-30B-A3B-Instruct-GGUF          | 57G  | 23.2s       | 149.8               | 60.0             | 28.7s          | 152.7                  | 63.3                | X                 |                           |                        | 22.4s          | 109.3                  | 41.1                |
| Kay6888__DeepSeek-Coder-V2-Lite-Instruct-GGUF       | 59G  | 25.2s       | 134.3               | 44.8             | 38.2s          | 106.7                  | 45.3                | X                 |                           |                        | 23.9s          | 35.3                   | 37.9                |
| unsloth__Qwen3.5-35B-A3B-Experiments-GGUF           | 65G  | 27.7s       | 156.4               | 59.6             | 29.3s          | 141.4                  | 57.6                | X                 |                           |                        | 25.6s          | 279.9                  | 36.7                |
| lmstudio-community__Qwen3-Coder-Next-GGUF           | 79G  | 32.9s       | 126.4               | 61.2             | 41.7s          | 44.8                   | 46.5                | 26.2s             | 112.1                     | 59.0                   | 32.3s          | 105.1                  | 41.5                |

Legend: real value = working (with that number) | OK/n/a = working but this endpoint reports no timing breakdown (e.g. audio) | X = tested and rejected | - = untested/not_configured

Notable cross-backend finding: mlx-serve is the only backend that loaded
BOTH `unsloth__Qwen3-Coder-30B-A3B-Instruct-GGUF` and
`Kay6888__DeepSeek-Coder-V2-Lite-Instruct-GGUF` successfully -- these are
the exact two models ik_llama.cpp crashes on (`ggml.c:18950 fatal error`
during MoE expert-scheduling init). No backend is a strict superset of
another; every status is still from a real per-backend test.

Context-size data (`context_size` = ctx actually loaded, `context_size_max` =
native/trained max) isn't shown in this table -- export it instead:
`python3 render-inventory-table.py --format json --sort size`. Highlights: LM
Studio always loads at each model's full native max context; the router and
ik_llama.cpp both loaded at a fixed 4096 in this batch (`--ctx-size`
hard-coded in the test driver scripts, not model-chosen) except for
`mradermacher__OpenMath-CodeLlama-70b-Python-hf-GGUF`, whose native max is
only 2048; mlx-serve loaded everything at a fixed 8192 and does not expose a
separate native-max field at all via its `/v1/models`/`/props` (so
`context_size_max` stays `null` for every mlx-serve entry -- a real API gap,
not a probe bug, confirmed against its actual response shape).

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