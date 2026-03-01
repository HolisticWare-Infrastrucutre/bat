#!/bin/bash

export LLAMA_CPP_SERVER_PORT=11454
export LLAMA_CPP_MODEL_PATH="$HOME/Downloads/holisticware/gen-ai/models/phi-2.Q5_K_S.gguf"
export LLAMA_CPP=$HOME/Downloads/llama.cpp/macosx/llama.cpp-master/llama.cpp-master/build-macosx/bin/llama-server

$LLAMA_CPP \
    -ngl 80 \
    --min-p 0 \
    --repeat-penalty 1.05 \
    --no-webui \
    --timeout 300 \
    --flash-attn on \
    --jinja \
    --temp 0.7 \
    --top-p 0.8 \
    --top-k 20 \
    --ctx-size 32000 \
    --port $LLAMA_CPP_SERVER_PORT \
    --alias mixtral-8x7b-instruct \
    --model $LLAMA_CPP_MODEL_PATH


https://docs.servicestack.net/ai-server/llama-server#access-llama-server-from-c

https://dev.to/avatsaev/pro-developers-guide-to-local-llms-with-llamacpp-qwen-coder-qwencode-on-linux-15h


