#!/bin/bash


export MODELS=\
"
deepseek-coder:33b
deepseek-coder:latest
deepseek-coder-v2:latest
deepseek-coder-v2:236b
phi3.5:latest
phi:latest
deepseek-r1:latest
nomic-embed-text:latest
phi4:latest
marco-o1:latest
qwq:latest
all-minilm:latest
llama3.3:latest
#llama3.2-vision:latest
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
