#!/bin/bash


export DIRECTORY_ROOT=/Users/Shared/Projects/d/dotnet

export DIRECTORY=$DIRECTORY_ROOT/aspire
if [ ! -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does not exist."
  mkdir $DIRECTORY/
fi
git clone --recursive \
    https://github.com/dotnet/aspire.git \
    $DIRECTORY/m

export DIRECTORY=$DIRECTORY_ROOT/aspire-samples
if [ ! -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does not exist."
  mkdir $DIRECTORY/
fi
git clone --recursive \
    https://github.com/dotnet/aspire-samples.git \
    $DIRECTORY/m

