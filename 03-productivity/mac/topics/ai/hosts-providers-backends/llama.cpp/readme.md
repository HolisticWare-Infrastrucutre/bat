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
*   `test-model-load.sh MODEL_ID [PORT] [TIMEOUT_S]` -- one small
    `/v1/chat/completions` request against an already-running server.
    Reports `load_time_s` (isolated from inference, via the response's own
    `timings`), `total_elapsed_s`, `prompt_tokens_per_second`,
    `gen_tokens_per_second`.
*   `test-audio-model-load.sh MODEL_ID [PORT] [TIMEOUT_S]` -- sends
    `test-fixtures/test-audio.wav` to `/v1/audio/transcriptions`
    (multipart/form-data, OpenAI Whisper-compatible shape) for ASR models.
*   `test-vision-model-load.sh MODEL_ID [PORT] [TIMEOUT_S]` -- sends
    `test-fixtures/test-image.png` via `/v1/chat/completions` +
    `image_url` (base64 data URL) for OCR/vision models.
*   `test-inventory-models.sh [--mode text|audio|vision] [--external-port PORT] RESULTS_JSONL MODEL_ID [MODEL_ID...]`
    -- batch driver for the **llama.cpp router**: starts the router +
    watchdog once, loops the matching tester above over every model id
    (router's `--models-max 1` LRU-evicts between tests, no restart
    needed), tears down after. With `--external-port` (e.g. `11444` for LM
    Studio), skips starting/stopping anything and just loops the tests
    against that already-running server.
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