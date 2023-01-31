#!/bin/bash


brew uninstall \
    gtk+3 \
    gnome-icon-theme \

brew install \
    gtk+3 \
    gnome-icon-theme \

# WASM requirement
dotnet tool \
    uninstall \
        --global \
            dotnet-serve
dotnet tool \
    install \
        --global \
            dotnet-serve
dotnet tool \
    update \
        --global \
            dotnet-serve

uno-check




