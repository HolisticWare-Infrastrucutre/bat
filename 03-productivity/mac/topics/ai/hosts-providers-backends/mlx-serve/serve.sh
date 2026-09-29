#!/bin/bash

#export MODEL_PATH=$HOME/.lmstudio/models/mlx-community/gemma-4-31b-it-mxfp8
export MODEL_PATH=$HOME/.lmstudio/hub/models/qwen/qwen3-coder-next
export MODEL_PATH=~/.lmstudio/models/lmstudio-community/Qwen3.6-35B-A3B-GGUF/Qwen3.6-35B-A3B-Q8_0.gguf
export PORT=11474

```bash
mlx-serve \
mlx-serve \
    --model $MODEL_PATH \
    --serve \
    --port $PORT
```

```bash
mlx-serve \
    run \
        ~/.lmstudio/models/lmstudio-community/Qwen3.6-35B-A3B-GGUF/


mlx-serve \
    run \
        ~/.lmstudio/models/lmstudio-community/Qwen3.6-35B-A3B-GGUF/Qwen3.6-35B-A3B-Q8_0.gguf
```