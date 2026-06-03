#!/bin/bash

#export MODEL_PATH=$HOME/.lmstudio/models/mlx-community/gemma-4-31b-it-mxfp8
export MODEL_PATH=$HOME/.lmstudio/hub/models/qwen/qwen3-coder-next

export PORT=11474

mlx-serve \
    --model $MODEL_PATH \
    --serve \
    --port $PORT

