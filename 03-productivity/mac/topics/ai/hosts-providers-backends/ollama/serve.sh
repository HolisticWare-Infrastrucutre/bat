#!/bin/bash

export MODEL=qwen3-coder:latest
export PROMPT="Provide information about model run (type, arch, context length, etc.)"
# deepseek-coder:33b

OLLAMA_CONTEXT_LENGTH=256000
ollama \
    serve \
        $MODEL
ollama ps

# ollama serve --help
# Start Ollama
# 
# Usage:
#   ollama serve [flags]
# 
# Aliases:
#   serve, start
# 
# Flags:
#   -h, --help   help for serve
# 
# Environment Variables:
#       OLLAMA_DEBUG               Show additional debug information (e.g. OLLAMA_DEBUG=1)
#       OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)
#       OLLAMA_CONTEXT_LENGTH      Context length to use unless otherwise specified (default: 4k/32k/256k based on VRAM)
#       OLLAMA_KEEP_ALIVE          The duration that models stay loaded in memory (default "5m")
#       OLLAMA_MAX_LOADED_MODELS   Maximum number of loaded models per GPU
#       OLLAMA_MAX_QUEUE           Maximum number of queued requests
#       OLLAMA_MODELS              The path to the models directory
#       OLLAMA_NUM_PARALLEL        Maximum number of parallel requests
#       OLLAMA_NO_CLOUD            Disable Ollama cloud features (remote inference and web search)
#       OLLAMA_NOPRUNE             Do not prune model blobs on startup
#       OLLAMA_ORIGINS             A comma separated list of allowed origins
#       OLLAMA_SCHED_SPREAD        Always schedule model across all GPUs
#       OLLAMA_FLASH_ATTENTION     Enabled flash attention
#       OLLAMA_KV_CACHE_TYPE       Quantization type for the K/V cache (default: f16)
#       OLLAMA_LLM_LIBRARY         Set LLM library to bypass autodetection
#       OLLAMA_GPU_OVERHEAD        Reserve a portion of VRAM per GPU (bytes)
#       OLLAMA_LOAD_TIMEOUT        How long to allow model loads to stall before giving up (default "5m")
