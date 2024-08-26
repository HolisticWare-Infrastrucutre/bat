#!/bin/bash

# https://dotnet.microsoft.com/en-us/download/dotnet
# https://github.com/dotnet/installer/issues/11040

export OS=osx
export EXT=pkg

export VERSIONS=\
"
6.0.1xx
6.0.4xx
"
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

mkdir $HOME/Downloads/dotnet/

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for VERSION in $VERSIONS
do
    if [[ $VERSION == "#"* ]]
    then
        continue
    fi

    mkdir $HOME/Downloads/dotnet/$VERSION/
    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/

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
            -O https://aka.ms/dotnet/$VERSION/dotnet-$PRODUCT-$OS-$ARCH.$EXT

        done
    done

done



