#!/bin/bash

# https://dotnet.microsoft.com/en-us/download/dotnet
# https://github.com/dotnet/installer/issues/11040

export OS=osx
export EXT=pkg

export PRODUCTS=\
"
sdk
runtime
"
export ARCHITECTURES=\
"
arm64
x86
"

export VERSION=9.0

mkdir $HOME/Downloads/dotnet/
mkdir $HOME/Downloads/dotnet/$VERSION/
mkdir $HOME/Downloads/dotnet/$VERSION/$OS/

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for ARCH in $ARCHITECTURES
do
    if [[ $ARCH == "#"* ]]
    then
        continue
    fi

    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/

    for PRODUCT in $PRODUCTS
    do
        if [[ $PRODUCT == "#"* ]]
        then
            continue
        fi

        echo PRODUCT: $PRODUCT
        echo ARCH: $ARCH

        curl \
            -v -L -C - \
            --output-dir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/ \
           -O https://aka.ms/dotnet/$VERSION/preview/dotnet-$PRODUCT-$OS-$ARCH.$EXT

    done
done


# https://download.visualstudio.microsoft.com/download/pr
# 


35b0fb29-cadc-4083-aa26-6cecd2e7ffa1/1a9972a435b73ffdd0b462f979ea5b23/dotnet-sdk-8.0.403-osx-arm64.pkg