#!/bin/bash

# https://dotnet.microsoft.com/en-us/download/dotnet
# https://github.com/dotnet/installer/issues/11040

export OS=osx
export EXT=pkg

export VERSIONS=\
"
8.0
8.0.1xx
8.0.2xx
8.0.3xx
8.0.4xx
9.0
9.0.1xx
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
    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/
    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/daily/
    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/preview/

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

for VERSION in $VERSIONS
do
    if [[ $VERSION == "#"* ]]
    then
        echo skipping:
        echo "VERSION   :"  $VERSION
        continue
    fi

    mkdir $HOME/Downloads/dotnet/$VERSION/
    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/
    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/
    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/daily/
    mkdir $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/preview/

    for PRODUCT in $PRODUCTS
    do
        if [[ $PRODUCT == "#"* ]]
        then
            echo skipping:
            echo "PRODUCT   :"  $PRODUCT
            continue
        fi

        echo installing:
        echo "          "   $PRODUCT
        echo "PRODUCT   :"  $PRODUCT
        echo "ARCH.     :"  $ARCH
    done

done
