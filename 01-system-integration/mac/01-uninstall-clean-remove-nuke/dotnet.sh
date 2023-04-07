#!/bin/bash

# https://github.com/dotnet/sdk/blob/main/scripts/obtain/uninstall/dotnet-uninstall-pkgs.sh

sudo rm -rf /usr/local/share/dotnet/
sudo rm -fr /etc/paths.d/dotnet  
sudo rm -fr "$HOME/.dotnet/"

rm -fr "$HOME/Library/Caches/dotnet-script/"


