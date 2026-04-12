#!/bin/bash


# macOS ARM64 example
curl \
    -L https://github.com/Michael-A-Kuykendall/shimmy/releases/latest/download/shimmy-macos-arm64 \
    -o $HOME/bin/shimmy
chmod +x $HOME/bin/shimmy
# Auto-detects MLX on Apple Silicon
$HOME/bin/shimmy serve  
