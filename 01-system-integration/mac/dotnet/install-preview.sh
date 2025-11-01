#!/bin/zsh

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


for VERSION in $VERSIONS
do
    if [[ $VERSION == "#"* ]]
    then
        echo skipping:
        echo "VERSION   :"  $VERSION
        continue
    fi

    md $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/

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

        sudo \
            installer \
                -pkg $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/dotnet-$PRODUCT-$OS-$ARCH.$EXT \
                -target /



    done
done


dotnet --list-runtimes
dotnet --list-sdks

