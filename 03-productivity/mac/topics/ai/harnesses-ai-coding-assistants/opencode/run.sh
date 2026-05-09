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
opencode --model $MODEL
"

export MODEL=gemma4:31b
opencode --model $MODEL
