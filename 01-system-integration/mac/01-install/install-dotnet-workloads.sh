#!/bin/zsh

export WORKLOADZ=\
"\
"
#            maui-tizen \


sudo \
    dotnet workload \
        uninstall \
            android \
            ios \
            maccatalyst \
            macos \
            maui \
            maui-android \
            maui-ios \
            maui-maccatalyst \
            maui-mobile \
            maui-windows \
            tvos \
            wasm-tools

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
            maui-windows \
            tvos \
            wasm-tools

