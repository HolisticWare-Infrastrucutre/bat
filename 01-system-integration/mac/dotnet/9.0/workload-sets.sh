#!/bin/bash

# https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-workload-sets#choose-a-workload-set-version

sudo \
    dotnet workload \
        update \
            --version 8.0.403
dotnet workload \
    update \
        --print-rollback