#!/bin/bash


export MODELS=\
"
phi3.5:latest
phi:latest
deepseek-r1:latest
nomic-embed-text:latest
phi4:latest
marco-o1:latest
qwq:latest
all-minilm:latest
llama3.3:latest
llama3.2-vision:latest
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for MODEL in $MODELS;
do
    echo model = $MODEL
    ollama pull $MODEL
done
