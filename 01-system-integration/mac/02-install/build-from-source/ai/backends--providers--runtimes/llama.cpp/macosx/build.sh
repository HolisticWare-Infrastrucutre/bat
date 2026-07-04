#!/bin/bash

# https://github.com/ggml-org/llama.cpp/blob/master/docs/android.md
# https://www.reddit.com/r/LocalLLaMA/comments/1o7p34f/for_those_building_llamacpp_for_android/

# optimizations
# https://www.reddit.com/r/LocalLLaMA/comments/1o7rchv/llamacpp_gpu_support_on_android_device/
# https://www.reddit.com/r/LocalLLaMA/comments/1o7rchv/llamacpp_gpu_support_on_android_device/


# source $HOME/bat/01-system-integration/mac/02-install/ai/llama-cpp-android.sh

export URL=https://github.com/ggml-org/llama.cpp/archive/refs/heads/master.zip

export FOLDER=$HOME/Downloads/HolisticWare/ai/llama.cpp/macosx
rm -fr  $FOLDER
md      $FOLDER

curl \
    -v -L -C - \
    -o $FOLDER/llama.cpp.zip \
    -O $URL
  
unzip \
    $FOLDER/llama.cpp.zip \
    -d $FOLDER/llama.cpp-master/

cd $FOLDER/llama.cpp-master/llama.cpp-master/

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


ls -lah  $(readlink -f /opt/homebrew/bin/llama-cli)
ls -lah $FOLDER/llama.cpp-master/llama.cpp-master/build-macosx/bin/llama-cli

ls -lah  $(readlink -f /opt/homebrew/bin/llama-server)
ls -lah $FOLDER/llama.cpp-master/llama.cpp-master/build-macosx/bin/llama-server

rm -fr  $HOME/bin/llama.cpp-cli
md      $HOME/bin/llama.cpp-cli/
cp -r \
    $FOLDER/llama.cpp-master/llama.cpp-master/build-macosx/bin/* \
    $HOME/bin/llama.cpp-cli/