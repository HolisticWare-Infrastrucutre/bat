#!/bin/bash

export PROVIDER=openai
export PORT=11434
export MODEL=qwen3-coder:latest

# deepseek-coder:33b

llxprt \
    --provider $PROVIDER \
    --baseurl http://127.0.0.1:$PORT/v1 \
    --model $MODEL
