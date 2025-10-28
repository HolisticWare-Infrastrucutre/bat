#!/bin/bash

# https://github.com/ggml-org/llama.cpp/blob/master/docs/android.md

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

# https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html

cmake \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_SDK_ROOT/ndk/29.0.14206865/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-29 \
  -DCMAKE_C_FLAGS="-march=armv8-a -O3 -Wall -Wextra" \
  -DCMAKE_CXX_FLAGS="-march=armv8-a -O3 -Wall -Wextra" \
  -DGGML_OPENMP=OFF \
  -DGGML_LLAMAFILE=OFF \
  -DLLAMA_CURL=OFF \
  -B build-android

cmake --build build-android --config Release -- -j 8




# https://www.reddit.com/r/LocalLLaMA/wiki/models/
# https://huggingface.co/models?sort=modified&search=ggml
# https://huggingface.co/models?sort=downloads&search=llama+ggml

# wget \
#   https://huggingface.co/someuser/model/resolve/main/model.gguf?download=true \
#   -O model.gguf

cd $HOME/Downloads/llama.cpp/
if [ ! -f model.gguf ]; 
then
  wget \
    https://huggingface.co/ggml-org/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-f16.gguf \
    -O model.gguf
fi

adb shell "mkdir /data/local/tmp/llama.cpp"
adb push \
    $HOME/Downloads/llama.cpp/llama.cpp-master/llama.cpp-master/build-android/ \
    /data/local/tmp/llama.cpp/
adb push \
  ./model.gguf \
  /data/local/tmp/llama.cpp/

adb shell "cd /data/local/tmp/llama.cpp"
adb shell "LD_LIBRARY_PATH=./build-android/bin ./build-android/bin/llama-simple -m model.gguf"


cd -


# open $HOME/Downloads/llama.cpp/


# $HOME/Library/Caches/llama.cpp/

# llama-cli -hf ggml-org/gemma-3-1b-it-GGUF
# $HOME/Library/Caches/llama.cpp/ggml-org_gemma-3-1b-it-GGUF_gemma-3-1b-it-Q4_K_M.gguf


# illegal instruction
# https://github.com/ggml-org/llama.cpp/issues/402
# https://github.com/ggml-org/llama.cpp/issues/8734
# https://github.com/LostRuins/koboldcpp/issues/624
#  -O3 -Wall -Wextra
#  -O3 -Wall -Wextra -mcpu=generic
# -march=armv9-a+nosve

# CFLAGS 	 += -march=armv9-a+nosve
# CXXFLAGS += -march=armv9-a+nosve


# https://developer.android.com/training/data-storage
adb shell
cd /data/local/tmp/llama.cpp
LD_LIBRARY_PATH=./build-android/bin ./build-android/bin/llama-simple -m model.gguf


adb shell ls /data/local/tmp