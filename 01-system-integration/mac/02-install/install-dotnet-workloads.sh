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
            wasm-tools \
                --from-rollback-file https://aka.ms/dotnet/maui/main.json \
                --source https://aka.ms/dotnet6/nuget/index.json \
                --source https://aka.ms/dotnet/maui/main.json \
                --source https://api.nuget.org/v3/index.json

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
            wasm-tools \
                --source https://pkgs.dev.azure.com/dnceng/public/_packaging/darc-pub-dotnet-runtime-dea52219/nuget/v3/index.json \
                --source https://aka.ms/dotnet6/nuget/index.json \
                --source https://api.nuget.org/v3/index.json \




sudo dotnet workload \
    install \
        maui \
        maui-android \
        maui-ios \
        maui-maccatalyst \
        maui-desktop \
        maui-mobile \
        maui-windows \
        maui-tizen \
        wasm-tools-net6 \
