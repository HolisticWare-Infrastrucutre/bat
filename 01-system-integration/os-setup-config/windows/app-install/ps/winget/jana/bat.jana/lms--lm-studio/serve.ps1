
# $env:LLAMA_CPP_MODEL_PATH = "$HOME\.lmstudio\models\unsloth\Qwen3.6-35B-A3B-GGUF\Qwen3.6-35B-A3B-UD-Q4_K_S.gguf"
# $env:LLAMA_CPP_MODEL_PATH = "D:\jana\.lmstudio\models\lmstudio-community\Qwen3.6-35B-A3B-GGUF\Qwen3.6-35B-A3B-Q4_K_M.gguf"
$env:LLAMA_CPP_MODEL_PATH = "D:\jana\.lmstudio\models\lmstudio-community\gemma-3-4b-it-GGUF\gemma-3-4b-it-Q4_K_M.gguf"
$env:LLAMA_CPP_MODEL_PATH = "D:\jana\.lmstudio\models\lmstudio-community\Qwen3.6-27B-GGUF\Qwen3.6-27B-Q4_K_M.gguf"
$env:LLAMA_CPP_MODEL_PATH = "D:\jana\.lmstudio/models/lmstudio-community\Qwen3.6-35B-A3B-GGUF\Qwen3.6-35B-A3B-Q4_K_M.gguf"
$env:LLAMA_CPP_SERVER_PORT = 11444
#$env:LLAMA_CPP = "$HOME\Downloads\HolisticWare\ai\llama.cpp\macosx\llama.cpp-master\llama.cpp-master\build-macosx\bin\llama-server"
$env:LMS__LM_STUDIO = "lms"
$env:LMS__LM_STUDIO_CONTEXT_SIZE = 64000
$env:LMS__LM_STUDIO_TEMP = 0.8
$env:LMS__LM_STUDIO_MODEL_NAME = "qwen/qwen3.6-35b-a3b"
# $env:LMS__LM_STUDIO_MODEL_NAME = "mixtral-8x7b-instruct"

& $env:LMS__LM_STUDIO `
    start `
        --port $env:LLAMA_CPP_SERVER_PORT

& $env:LMS__LM_STUDIO `
    load `
        $env:LMS__LM_STUDIO_MODEL_NAME


