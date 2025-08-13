#!/bin/bash

# https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-workload-sets#choose-a-workload-set-version

export VERSION=8.0.402

sudo \
    dotnet workload \
        update \
            --version $VERSION
dotnet workload \
    update \
        --print-rollback