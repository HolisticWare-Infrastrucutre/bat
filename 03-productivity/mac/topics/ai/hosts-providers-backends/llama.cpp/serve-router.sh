#!/bin/bash


# Router mode: launch llama-server WITHOUT --model. It scans LLAMA_CPP_MODELS_DIR
# for GGUF files and loads/unloads models on demand per-request (LRU eviction
# above LLAMA_CPP_MODELS_MAX), instead of pinning one model at startup.
# https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md
#
# IMPORTANT: the directory scan is NOT recursive past one level, so it can't
# see ~/.lmstudio/models/<org>/<repo>/file.gguf directly (two levels deep).
# LLAMA_CPP_MODELS_DIR therefore points at a generated one-level symlink farm
# instead (id = folder/file name). Rebuild it after downloading new models:
#   $HOME/bat/03-productivity/mac/topics/ai/hosts-providers-backends/llama.cpp/build-router-models-dir.sh

export LLAMA_CPP=$HOME/Downloads/HolisticWare/ai/llama.cpp/macosx/llama.cpp-master/llama.cpp-master/build-macosx/bin/llama-server
export LLAMA_CPP_SERVER_PORT=11454
export LLAMA_CPP_MODELS_DIR="${LLAMA_CPP_MODELS_DIR:-$HOME/.cache/llama-router-models}"
export LLAMA_CPP_MODELS_MAX="${LLAMA_CPP_MODELS_MAX:-1}"
export LLAMA_CPP_CTX_SIZE="${LLAMA_CPP_CTX_SIZE:-32768}"

"$HOME/bat/03-productivity/mac/topics/ai/hosts-providers-backends/llama.cpp/build-router-models-dir.sh" > /dev/null

echo \
"
========================================================================================================================
$LLAMA_CPP \\
    --host 127.0.0.1 \\
    --port $LLAMA_CPP_SERVER_PORT \\
    --models-dir $LLAMA_CPP_MODELS_DIR \\
    --models-max $LLAMA_CPP_MODELS_MAX \\
    --models-autoload \\
    --webui-mcp-proxy \\
    --ctx-size $LLAMA_CPP_CTX_SIZE \\
    --flash-attn on \\
    --cache-type-k q8_0 \\
    --cache-type-v q8_0 \\
    --jinja \\
    -np 1

export LLAMA_CPP=$LLAMA_CPP
export LLAMA_CPP_SERVER_PORT=$LLAMA_CPP_SERVER_PORT
export LLAMA_CPP_MODELS_DIR=$LLAMA_CPP_MODELS_DIR
export LLAMA_CPP_MODELS_MAX=$LLAMA_CPP_MODELS_MAX
========================================================================================================================
"

$LLAMA_CPP \
    --host 127.0.0.1 \
    --port $LLAMA_CPP_SERVER_PORT \
    --models-dir $LLAMA_CPP_MODELS_DIR \
    --models-max $LLAMA_CPP_MODELS_MAX \
    --models-autoload \
    --webui-mcp-proxy \
    --ctx-size $LLAMA_CPP_CTX_SIZE \
    --flash-attn on \
    --cache-type-k q8_0 \
    --cache-type-v q8_0 \
    --jinja \
    -np 1

# Target a specific model per-request via the OpenAI-compatible "model" field
# (id = the symlink's basename under LLAMA_CPP_MODELS_DIR, e.g. org__repo), e.g.:
#
#   curl http://127.0.0.1:11454/v1/chat/completions \
#     -d '{"model":"unsloth__Qwen3-Coder-30B-A3B-Instruct-GGUF","messages":[{"role":"user","content":"hi"}]}'
#
# GET /v1/models lists all discovered ids, their --model/--mmproj resolution,
# and load status.
#
# To use a curated preset list instead of directory auto-discovery, write a
# models.ini next to this script and swap the --models-dir line above for:
#   --models-preset $HOME/bat/03-productivity/mac/topics/ai/hosts-providers-backends/llama.cpp/models.ini
