#!/bin/bash

sudo rm -fr /usr/local/share/dotnet 
sudo rm -fr $HOME/.dotnet/

open \
    -na "Google Chrome" \
        --args  \
        --new-window \
            "https://dotnet.microsoft.com/en-us/download" \
            "https://dotnet.microsoft.com/en-us/download/dotnet/7.0" \
            "https://dotnet.microsoft.com/en-us/download/dotnet/6.0" \            