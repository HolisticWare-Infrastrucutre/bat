#!/bin/bash

function dotnet_build()
{
    cd ~/git/coreclr
    sh ./build.sh
    cd ~/git/corefx
    sh ./build.sh
}

dotnet_build

