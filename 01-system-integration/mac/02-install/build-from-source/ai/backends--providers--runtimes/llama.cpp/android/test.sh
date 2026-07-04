#!/bin/bash

# https://developer.android.com/training/data-storage
adb shell <<'EOF'
cd /data/local/tmp/llama.cpp
LD_LIBRARY_PATH=./build-android/bin ./build-android/bin/llama-simple -m model.gguf -n 200000 How to deserialize JSON in C#?
EOF


