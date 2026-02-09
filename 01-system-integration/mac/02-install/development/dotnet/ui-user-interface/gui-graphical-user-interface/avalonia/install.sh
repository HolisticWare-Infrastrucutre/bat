#!/bin/bash

dotnet new \
    uninstall \
        Avalonia.Templates
    
dotnet new \
    install \
        Avalonia.Templates


