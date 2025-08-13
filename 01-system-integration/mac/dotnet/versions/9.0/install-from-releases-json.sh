#!/bin/bash

# https://dotnet.microsoft.com/en-us/download/dotnet
# https://github.com/dotnet/installer/issues/11040

# https://download.visualstudio.microsoft.com/download/pr
# 

export URL_ROOT_DOTNET=https://download.visualstudio.microsoft.com/download/pr
export URL_PART=35b0fb29-cadc-4083-aa26-6cecd2e7ffa1/1a9972a435b73ffdd0b462f979ea5b23/dotnet-sdk-8.0.403-osx-arm64.pkg

mkdir $HOME/Downloads/dotnet/

curl \
    -v -L -C - \
    --output-dir $HOME/Downloads/dotnet/ \
    -O $URL_ROOT_DOTNET/$URL_PART

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

