

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
                maui-android \
                android \
                    --verbosity diag \
                    --source https://api.nuget.org/v3/index.json
