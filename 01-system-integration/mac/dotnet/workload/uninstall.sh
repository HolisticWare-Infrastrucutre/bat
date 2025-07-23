#!/bin/zsh

source $HOME/bat/01-system-integration/mac/01-uninstall-clean-remove-nuke/nuget.sh

export WORKLOADZ=\
"\
"
#            maui-tizen \

sudo \
    dotnet \
        workload \
            uninstall \
                android \
                ios \
                maccatalyst \
                tvos \
                macos \
                maui \
                maui \
                maui-android \
                maui-ios \
                maui-maccatalyst \
                maui-mobile \
                maui-windows \
                maui-tizen \
                tvos \
                wasm-tools \
                wasm-tools-net8 \
                wasm-tools-net9 \
                wasm-experimental \
                wasm-experimental-net8 \
                wasm-experimental-net9 \
                aspire \

#                android-net8 \
