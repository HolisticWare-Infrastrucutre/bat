#!/bin/bash

# https://github.com/ggml-org/llama.cpp/blob/master/docs/android.md
# https://www.reddit.com/r/LocalLLaMA/comments/1o7p34f/for_those_building_llamacpp_for_android/

# optimizations
# https://www.reddit.com/r/LocalLLaMA/comments/1o7rchv/llamacpp_gpu_support_on_android_device/
# https://www.reddit.com/r/LocalLLaMA/comments/1o7rchv/llamacpp_gpu_support_on_android_device/


# source $HOME/bat/01-system-integration/mac/02-install/ai/llama-cpp-android.sh

export URL=https://github.com/ggml-org/llama.cpp/archive/refs/heads/master.zip

export FOLDER=$HOME/Downloads/llama.cpp/android
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

# https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html

# fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp

adb shell cat /proc/cpuinfo | grep Features

rm -fr build-android/

cmake \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_SDK_ROOT/ndk/29.0.14206865/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-35 \
  -DCMAKE_C_FLAGS="-march=armv8-a -O3 -Wall -Wextra" \
  -DCMAKE_CXX_FLAGS="-march=armv8-a -O3 -Wall -Wextra" \
  -DGGML_OPENMP=OFF \
  -DGGML_LLAMAFILE=OFF \
  -DLLAMA_CURL=OFF \
  -B build-android

cmake \
  --build build-android \
  --config Release \
  -- \
  -j 8
