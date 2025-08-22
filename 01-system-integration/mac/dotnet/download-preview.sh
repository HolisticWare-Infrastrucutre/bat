#!/bin/bash

# https://dotnet.microsoft.com/en-us/download/dotnet
# https://github.com/dotnet/installer/issues/11040

export OS=osx
export EXT=pkg

export VERSIONS=\
"
10.0
10.0.1xx
"
export PRODUCTS=\
"
sdk
runtime
"


if [[ $(uname -m) == 'arm64' ]]; 
then
  echo ARM M1 - $(uname -m)
  export ARCH=arm64
else
  echo Intel x86 - $(uname -m)
  export ARCH=x86
fi

md $HOME/Downloads/dotnet/

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for VERSION in $VERSIONS
do
    if [[ $VERSION == "#"* ]]
    then
        continue
    fi

    md $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/

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

        curl \
            -v -L -C - \
            --output-dir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/daily/ \
        -O https://aka.ms/dotnet/$VERSION/daily/dotnet-$PRODUCT-$OS-$ARCH.$EXT

        curl \
            -v -L -C - \
            --output-dir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/preview/ \
        -O https://aka.ms/dotnet/$VERSION/preview/dotnet-$PRODUCT-$OS-$ARCH.$EXT

    done

done
