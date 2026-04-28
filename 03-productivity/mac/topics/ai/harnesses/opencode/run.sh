#!/bin/bash

if [[ $# -eq 1 ]];
then
    echo "claude --model $1"
    export MODEL=$1
else
    export MODEL=qwen3-coder-next:q8_0
fi

echo \
"
export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_API_KEY=""
export ANTHROPIC_BASE_URL=http://localhost:11434
claude --model $MODEL
"

export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_API_KEY=""
export ANTHROPIC_BASE_URL=http://localhost:11434
claude --model $MODEL
