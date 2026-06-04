#!/bin/bash

# https://dotnet.microsoft.com/en-us/download/dotnet
# https://github.com/dotnet/installer/issues/11040

# https://aka.ms/dotnet/{version}/dotnet-{product}-{os}-{arch}.{ext}
#   https://aka.ms/dotnet/10.0/dotnet-sdk-osx-arm64.pkg

# wget \
#     --output-document $FOLDER/a.pkg \
#         https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-10.0.100-preview.7-macos-arm64-installer

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
9.0.2xx
9.0.3xx
10.0
10.0.1xx
10.0.2xx
10.0.3xx
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

FOLDER=$HOME/Downloads/HolisticWare/dotnet/
md $FOLDER

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for VERSION in $VERSIONS
do
    if [[ $VERSION == "#"* ]]
    then
        continue
    fi

    md $FOLDER/$VERSION/$OS/$ARCH/

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
            --output-dir $FOLDER/$VERSION/$OS/$ARCH/ \
        -O https://aka.ms/dotnet/$VERSION/dotnet-$PRODUCT-$OS-$ARCH.$EXT

        curl \
            -v -L -C - \
            --output-dir $FOLDER/$VERSION/$OS/$ARCH/daily/ \
        -O https://aka.ms/dotnet/$VERSION/daily/dotnet-$PRODUCT-$OS-$ARCH.$EXT

        curl \
            -v -L -C - \
            --output-dir $FOLDER/$VERSION/$OS/$ARCH/preview/ \
        -O https://aka.ms/dotnet/$VERSION/preview/dotnet-$PRODUCT-$OS-$ARCH.$EXT

    done

done
