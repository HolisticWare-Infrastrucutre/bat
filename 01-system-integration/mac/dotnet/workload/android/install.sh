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
                android \
                maui-android \
                    --verbosity diag \
                    --source https://api.nuget.org/v3/index.json
