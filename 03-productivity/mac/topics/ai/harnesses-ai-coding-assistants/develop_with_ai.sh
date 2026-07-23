#!/bin/bash

export DIR_CURRENT=$(pwd)
ttab \
    -w \
    -d $DIR_CURRENT \
    claude

ttab \
    -d $DIR_CURRENT \
    copilot

ttab \
    -d $DIR_CURRENT \
    "export ANTHROPIC_API_KEY=\"\"; export ANTHROPIC_BASE_URL=http://localhost:11454; export ANTHROPIC_MODEL=Qwen3.6-35B-A3; claude --model $ANTHROPIC_MODEL"

ttab \
    -d $DIR_CURRENT \
    "export COPILOT_OFFLINE=true; export COPILOT_PROVIDER_API_KEY= ; export COPILOT_PROVIDER_BASE_URL=http://localhost:11454 ; export COPILOT_MODEL=Qwen3.6-35B-A3; copilot"

ttab \
    -d $DIR_CURRENT \
    opencode

ttab \
    -d $DIR_CURRENT \
    pi

ttab \
    -d $DIR_CURRENT \
    hermes
