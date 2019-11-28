#!/bin/bash

wget https://dotnetwebsite.azurewebsites.net/download/dotnet-core/scripts/v1/dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh -Channel LTS
export PATH="$PATH:$HOME/.dotnet"

echo 'export PATH=\"$PATH:$HOME/.dotnet\"' >> ~/.bashrc
echo 'export PATH=\"$PATH:$HOME/.dotnet\"' >> ~/.profile