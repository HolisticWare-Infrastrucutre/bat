#!/bin/bash


export MODELS=\
"
qwen2.5-coder:32b
qwen3-vl:32b
qwen2.5vl:32b
qwen3:32b
qwen2.5-coder:32b
qwen2-math:72b
deepseek-coder:33b
# gemma3:27b
# gemma3:12b
# gemma3:4b
# gemma3:latest
# gpt-oss:120b
# gpt-oss:latest
# gpt-oss:20b
# phind-codellama:34b
# phind-codellama:latest
# mistral-large:123b
# mistral-large:latest
# codegemma:7b
# codegemma:latest
# codellama:70b
# deepseek-coder-v2:236b
# deepseek-coder-v2:latest
# deepseek-coder:latest
# deepseek-coder:33b
# llama3.3:latest
# all-minilm:latest
# qwq:latest
# marco-o1:latest
# phi4:latest
# deepseek-r1:latest
# nomic-embed-text:latest
# phi:latest
# phi3.5:latest
# llama3.2-vision:latest
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for MODEL in $MODELS;
do
    echo "......................................................................"
    if [[ $MODEL == "#"* ]]
    then
        echo skipping:
        echo        $MODEL
        continue
    fi

    echo installing:
    echo        $MODEL
    ollama pull $MODEL
done



