#!/bin/bash


#export LLAMA_CPP_MODEL_PATH="$HOME/Downloads/holisticware/gen-ai/models/phi-2.Q5_K_S.gguf"

# export LLAMA_CPP_MODEL_PATH="$HOME/.lmstudio/models/unsloth/Qwen3.5-35B-A3B-Experiments-GGUF/Qwen3.5-35B-A3B_tok-16_out-16_exp-16-16-16_shr-16-16-16_ssm-16-16-16-32_atn-16-16-16-16-16-16.gguf"
export LLAMA_CPP_MODEL_PATH="$HOME/.lmstudio/models/unsloth/Qwen3.6-35B-A3B-GGUF/Qwen3.6-35B-A3B-UD-Q4_K_S.gguf"

export LLAMA_CPP_SERVER_PORT=11454
export LLAMA_CPP=$HOME/Downloads/HolisticWare/ai/llama.cpp/macosx/llama.cpp-master/llama.cpp-master/build-macosx/bin/llama-server 
export LLAMA_CPP_CONTEXT_SIZE=262144
export LLAMA_CPP_TEMP=0.8
export LLAMA_CPP_MODEL_NAME="Qwen3.6-35B-A3B"
# export LLAMA_CPP_MODEL_NAME="mixtral-8x7b-instruct"

echo \
"
========================================================================================================================
$LLAMA_CPP \\
    -ngl 80 \\
    --min-p 0 \\
    --repeat-penalty 1.05 \\
    --timeout 300 \\
    --flash-attn on \\
    --jinja \\
    --temp $LLAMA_CPP_TEMP \\
    --top-p 0.8 \\
    --top-k 20 \\
    --ctx-size $LLAMA_CPP_CONTEXT_SIZE \\
    --port $LLAMA_CPP_SERVER_PORT \\
    --alias $LLAMA_CPP_MODEL_NAME \\
    --model $LLAMA_CPP_MODEL_PATH

export LLAMA_CPP_SERVER_PORT=$LLAMA_CPP_SERVER_PORT
export LLAMA_CPP=$LLAMA_CPP
========================================================================================================================
"

$LLAMA_CPP \
    -ngl 80 \
    --min-p 0 \
    --repeat-penalty 1.05 \
    --timeout 300 \
    --flash-attn on \
    --jinja \
    --temp 0.7 \
    --top-p 0.8 \
    --top-k 20 \
    --ctx-size $LLAMA_CPP_CONTEXT_SIZE \
    --port $LLAMA_CPP_SERVER_PORT \
    --alias $LLAMA_CPP_MODEL_NAME \
    --model $LLAMA_CPP_MODEL_PATH



# llama-server \
#     --host 0.0.0.0 \
#     --port 11464  \
#     --ctx-size 0 \
#     --model ~/.lmstudio/models/unsloth/Qwen3-Coder-Next-GGUF/Qwen3-Coder-Next-UD-Q8_K_XL-00001-of-00003.gguf

echo \
"
========================================================================================================================
$LLAMA_CPP \
    -ngl 80 \
    --min-p 0 \
    --repeat-penalty 1.05 \
    --timeout 300 \
    --flash-attn on \
    --jinja \
    --temp 0.7 \
    --top-p 0.8 \
    --top-k 20 \
    --ctx-size $LLAMA_CPP_CONTEXT_SIZE \
    --port $LLAMA_CPP_SERVER_PORT \
    --alias $LLAMA_CPP_MODEL_NAME \
    --model $LLAMA_CPP_MODEL_PATH

export LLAMA_CPP_SERVER_PORT=$LLAMA_CPP_SERVER_PORT
export LLAMA_CPP=$LLAMA_CPP
========================================================================================================================
"