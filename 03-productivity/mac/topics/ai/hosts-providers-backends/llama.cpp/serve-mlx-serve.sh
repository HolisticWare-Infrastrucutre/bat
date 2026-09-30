#!/bin/bash

# Router-style launch for mlx-serve: --model-dir scans a directory and
# discovers every model as an on-demand-loadable id (like llama.cpp's
# router mode), instead of pinning one model at startup. Reuses the SAME
# one-level symlink farm router mode uses, so ids match the inventory's
# canonical org__repo ids with zero translation needed.
#   https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md (sibling project; mlx-serve embeds llama.cpp for GGUF)
#
# Unlike llama.cpp's router, mlx-serve's own /v1/chat/completions response
# already uses the exact same "timings" shape llama.cpp uses, so the
# existing test-model-load.sh / test-vision-model-load.sh testers work here
# completely unmodified. Two confirmed backend-level limitations (see
# models-inventory.json's mlx_serve notes for the full detail):
#   - no /v1/audio/transcriptions route at all -- speech_asr_tts entries are
#     status "untested" for mlx_serve, not tested via any endpoint.
#   - --model-dir discovery does not auto-pair a model's mmproj/vision-tower
#     file the way llama.cpp router's --mmproj auto-detection does, so
#     vision/OCR requests fail with "serving without its vision tower" even
#     though the mmproj file sits right next to the model in the farm.

export MLX_SERVE_BIN="${MLX_SERVE_BIN:-mlx-serve}"
export MLX_SERVE_PORT="${MLX_SERVE_PORT:-11474}"
export MLX_SERVE_MODELS_DIR="${MLX_SERVE_MODELS_DIR:-$HOME/.cache/llama-router-models}"
export MLX_SERVE_MAX_RESIDENT="${MLX_SERVE_MAX_RESIDENT:-1}"

"$HOME/bat/03-productivity/mac/topics/ai/hosts-providers-backends/llama.cpp/build-router-models-dir.sh" > /dev/null

echo \
"
========================================================================================================================
$MLX_SERVE_BIN \\
    --serve \\
    --host 127.0.0.1 \\
    --port $MLX_SERVE_PORT \\
    --model-dir $MLX_SERVE_MODELS_DIR \\
    --max-resident-models $MLX_SERVE_MAX_RESIDENT
========================================================================================================================
"

"$MLX_SERVE_BIN" \
    --serve \
    --host 127.0.0.1 \
    --port "$MLX_SERVE_PORT" \
    --model-dir "$MLX_SERVE_MODELS_DIR" \
    --max-resident-models "$MLX_SERVE_MAX_RESIDENT"

# Target a specific model per-request via the OpenAI-compatible "model" field
# (id = the symlink's basename under MLX_SERVE_MODELS_DIR, same ids as the
# llama.cpp router), e.g.:
#
#   curl http://127.0.0.1:11474/v1/chat/completions \
#     -d '{"model":"unsloth__Qwen3-Coder-30B-A3B-Instruct-GGUF","messages":[{"role":"user","content":"hi"}]}'
#
# GET /v1/models lists all discovered ids and load state.
