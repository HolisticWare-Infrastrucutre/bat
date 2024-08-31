#!/bin/bash

# https://dotnet.microsoft.com/en-us/download/dotnet
# https://github.com/dotnet/installer/issues/11040


# export PACKAGES=$(ls -1 $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/*.pkg)

export OS=osx
export VERSION=6.0.4xx


if [[ $(uname -m) == 'arm64' ]]; 
then
  echo ARM M1 - $(uname -m)
  export ARCH=arm64
else
  echo Intel x86 - $(uname -m)
  export ARCH=x86
fi


IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for PACKAGE in $HOME/Downloads/dotnet/$VERSION/$OS/$ARCH/*.pkg
do
    sudo installer -verbose -pkg "$PACKAGE" -target /
    # installer -pkg myapp.pkg -target CurrentUserHomeDirectory
done