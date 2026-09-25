#!/bin/bash

export MODEL_NAME="Qwen3.6-35B-A3B"
export PORT=11454

export DIR_CURRENT=$(pwd)

ttab \
    -w \
    -d $DIR_CURRENT \
    "source ~/bat/03-productivity/mac/topics/ai/hosts-providers-backends/llama.cpp/serve-$MODEL_NAME.sh"

ttab \
    -d $DIR_CURRENT \
    "export ANTHROPIC_API_KEY=''; export ANTHROPIC_BASE_URL=http://localhost:$PORT; export ANTHROPIC_MODEL=$MODEL_NAME; claude --model $MODEL_NAME"

ttab \
    -d $DIR_CURRENT \
    "export COPILOT_OFFLINE=true; export COPILOT_PROVIDER_API_KEY= ; export COPILOT_PROVIDER_BASE_URL=http://localhost:$PORT ; export COPILOT_MODEL=$MODEL_NAME; copilot"

ttab \
    -d $DIR_CURRENT \
    opencode

ttab \
    -d $DIR_CURRENT \
    hermes

ttab \
    -d $DIR_CURRENT \
    "echo harnesses to the right have no plan mode"

ttab \
    -d $DIR_CURRENT \
    pi

ttab \
    -d $DIR_CURRENT \
    crush
    
ttab \
    -d $DIR_CURRENT \
    "export SMALLCODE_MODEL=$MODEL_NAME; export SMALLCODE_BASE_URL=http://localhost:$PORT/v1; smallcode"

