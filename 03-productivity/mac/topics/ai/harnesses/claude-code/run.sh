#!/bin/bash

if [[ $# -eq 1 ]];
then
    echo "claude --model $1"    
fi

echo \
"
export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_API_KEY=""
export ANTHROPIC_BASE_URL=http://localhost:11434
claude --model qwen3-coder-next:q8_0  
"

export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_API_KEY=""
export ANTHROPIC_BASE_URL=http://localhost:11434
claude --model qwen3-coder-next:q8_0  
