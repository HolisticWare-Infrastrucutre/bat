#!/bin/bash

# https://github.com/antimatter15/alpaca.cpp
# https://github.com/rupeshs/alpaca.cpp


export URL=https://github.com/antimatter15/alpaca.cpp/archive/refs/heads/master.zip

rm -fr  $HOME/Downloads/alpaca.cpp/
md      $HOME/Downloads/alpaca.cpp/

curl \
    -v -L -C - \
    -o $HOME/Downloads/alpaca.cpp/alpaca.cpp.zip \
    -O $URL

unzip \
    $HOME/Downloads/alpaca.cpp/alpaca.cpp.zip \
    -d $HOME/Downloads/alpaca.cpp/alpaca.cpp-master/

cd $HOME/Downloads/alpaca.cpp/alpaca.cpp-master/alpaca.cpp-master/

cmake .
cmake --build . --config Release

curl \
    -v -L -C - \
    -o $HOME/Downloads/alpaca.cpp/alpaca.cpp-master/ggml-alpaca-7b-q4.bin \
    -O https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/resolve/main/ggml-alpaca-7b-q4.bin

$HOME/Downloads/alpaca.cpp/alpaca.cpp-master/alpaca.cpp-master/chat

cd -