#!/bin/bash

# https://github.com/ggml-org/llama.cpp/blob/master/docs/android.md
# https://www.reddit.com/r/LocalLLaMA/comments/1o7p34f/for_those_building_llamacpp_for_android/

# optimizations
# https://www.reddit.com/r/LocalLLaMA/comments/1o7rchv/llamacpp_gpu_support_on_android_device/
# https://www.reddit.com/r/LocalLLaMA/comments/1o7rchv/llamacpp_gpu_support_on_android_device/

cmake .. \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_SDK_ROOT/ndk/29.0.14206865/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-35 \
  -DANDROID_STL=c++_static \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=OFF \
  \
  `# GPU (OpenCL only, Vulkan has header issues in NDK 26)` \
  -DGGML_OPENCL=ON \
  -DGGML_VULKAN=OFF \
  \
  `# CPU Optimizations` \
  -DGGML_OPENMP=ON \
  -DGGML_LLAMAFILE=ON \
  \
  `# Explicit CPU features (I8MM, BF16, DotProd)` \
  -DCMAKE_C_FLAGS="-march=armv8.6-a+i8mm+bf16+dotprod -O3 -flto=thin" \
  -DCMAKE_CXX_FLAGS="-march=armv8.6-a+i8mm+bf16+dotprod -O3 -flto=thin" \
  -DCMAKE_EXE_LINKER_FLAGS="-flto=thin" \
  \
  `# OpenMP` \
  -DOpenMP_C_FLAGS="-fopenmp -static-openmp"    \
  -DOpenMP_CXX_FLAGS="-fopenmp -    static-openmp" \
  -DOpenMP_C_LIB_NAMES="omp" \
  -DOpenMP_CXX_LIB_NAMES="omp" \
  -DOpenMP_omp_LIBRARY="$HOME/android-sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/17/lib/linux/aarch64/libomp.so" \
  \
  -DLLAMA_CURL=OFF
