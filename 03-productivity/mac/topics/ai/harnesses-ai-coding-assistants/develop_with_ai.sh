#!/bin/bash

#export MODEL_NAME="Qwen3.6-35B-A3B"
export MODEL_NAME="Qwen3.8-27B"

export DIR_CURRENT=$(pwd)
ttab \
    -w \
    -d $DIR_CURRENT \
    claude

ttab \
    -d $DIR_CURRENT \
    copilot
