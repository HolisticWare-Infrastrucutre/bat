#!/bin/bash

# https://github.com/ikawrakow/ik_llama.cpp
export URL=https://github.com/ikawrakow/ik_llama.cpp/archive/refs/heads/main.zip

export FOLDER=$HOME/Downloads/HolisticWare/ai/ik_llama.cpp/macosx

rm -fr  $FOLDER
md      $FOLDER

curl \
    -v -L -C - \
    -o $FOLDER/ik_llama.cpp.zip \
    -O $URL
  
unzip \
    $FOLDER/ik_llama.cpp.zip \
    -d $FOLDER/ik_llama.cpp-main/

cd $FOLDER/ik_llama.cpp-main/ik_llama.cpp-main/


# fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp

adb shell cat /proc/cpuinfo | grep Features

rm -fr build-macosx/

cmake \
  -DCMAKE_C_FLAGS="-O3 -Wall -Wextra" \
  -DCMAKE_CXX_FLAGS="-O3 -Wall -Wextra" \
  -B build-macosx
  
#  -DGGML_OPENMP=OFF \
#  -DGGML_LLAMAFILE=OFF \
#  -DLLAMA_CURL=OFF \

cmake \
  --build build-macosx \
  --config Release \
  -- \
  -j 8


rm -fr  $HOME/bin/ik_llama.cpp-cli
md      $HOME/bin/ik_llama.cpp-cli/
cp -r \
    $FOLDER/ik_llama.cpp-main/ik_llama.cpp-master/build-macosx/bin/* \
    $HOME/bin/ik_llama.cpp-cli/