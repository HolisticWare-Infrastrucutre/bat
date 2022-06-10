#!/bin/zsh

sudo \
    dotnet workload \
        install \
            android \
            ios \
            maccatalyst \
            macos \
            maui \
            maui-android \
            maui-ios \
            maui-maccatalyst \
            maui-mobile \
            maui-tizen \
            maui-windows \
            tvos \
            wasm-tools
