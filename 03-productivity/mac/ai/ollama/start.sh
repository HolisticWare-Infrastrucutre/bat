#!/bin/bash

export MODEL=qwen3-coder:latest

# deepseek-coder:33b

ollama \
    run \
        $MODEL

