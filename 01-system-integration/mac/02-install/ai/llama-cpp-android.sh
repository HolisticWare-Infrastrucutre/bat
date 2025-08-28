#!/bin/bash

# source $HOME/bat/01-system-integration/mac/02-install/ai/llama-cpp-android.sh

export URL=https://github.com/ggml-org/llama.cpp/archive/refs/heads/master.zip

rm -fr  $HOME/Downloads/llama.cpp/
md      $HOME/Downloads/llama.cpp/

curl \
    -v -L -C - \
    -o $HOME/Downloads/llama.cppllama.cpp.zip \
    -O $URL

unzip \
    $HOME/Downloads/llama.cppllama.cpp.zip \
    -d $HOME/Downloads/llama.cpp/llama.cpp-master/

cd $HOME/Downloads/llama.cpp/llama.cpp-master/llama.cpp-master/

cmake \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_SDK_ROOT/ndk/29.0.13599879/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-28 \
  -DCMAKE_C_FLAGS="-march=armv8.7a" \
  -DCMAKE_CXX_FLAGS="-march=armv8.7a" \
  -DGGML_OPENMP=OFF \
  -DGGML_LLAMAFILE=OFF \
  -DLLAMA_CURL=OFF \
  -B build-android

cmake --build build-android --config Release -- -j 8


cd -
