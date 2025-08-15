#!/bin/bash

# https://platform.uno/docs/articles/get-started-dotnet-new.html?tabs=macos

dotnet new \
    uninstall \
        Uno.Templates

dotnet new \
    install \
        Uno.Templates

dotnet tool \
    uninstall \
        --global \
            uno.check

uno-check

$HOME/.dotnet/tools/uno-check


