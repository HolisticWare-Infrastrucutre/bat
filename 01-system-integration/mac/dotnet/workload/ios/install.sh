#!/bin/zsh

sudo \
    dotnet \
        workload \
            update \
                --verbosity diag \
                --source https://api.nuget.org/v3/index.json

sudo \
    dotnet \
        workload \
            install \
                ios \
                maui-ios \
                    --verbosity diag \
                    --source https://api.nuget.org/v3/index.json
