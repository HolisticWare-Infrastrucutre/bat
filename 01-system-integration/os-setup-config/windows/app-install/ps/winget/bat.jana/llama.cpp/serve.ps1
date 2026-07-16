$env:LLAMA_CPP_MODEL_PATH = "$HOME\.lmstudio\models\unsloth\Qwen3.6-35B-A3B-GGUF\Qwen3.6-35B-A3B-UD-Q4_K_S.gguf"

$env:LLAMA_CPP_SERVER_PORT = 11454
$env:LLAMA_CPP = "$HOME\Downloads\HolisticWare\ai\llama.cpp\macosx\llama.cpp-master\llama.cpp-master\build-macosx\bin\llama-server"
$env:LLAMA_CPP_CONTEXT_SIZE = 262144
$env:LLAMA_CPP_TEMP = 0.8
$env:LLAMA_CPP_MODEL_NAME = "Qwen3.6-35B-A3B"
# $env:LLAMA_CPP_MODEL_NAME = "mixtral-8x7b-instruct"

& $env:LLAMA_CPP `
    -ngl 80 `
    --min-p 0 `
    --repeat-penalty 1.05 `
    --timeout 300 `
    --flash-attn on `
    --jinja `
    --temp 0.7 `
    --top-p 0.8 `
    --top-k 20 `
    --ctx-size $env:LLAMA_CPP_CONTEXT_SIZE `
    --port $env:LLAMA_CPP_SERVER_PORT `
    --alias $env:LLAMA_CPP_MODEL_NAME `
    --model $env:LLAMA_CPP_MODEL_PATH