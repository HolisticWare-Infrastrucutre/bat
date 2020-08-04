#!/bin/bash

# install-dotnet-core-uninstall.sh

cd 
curl -OL \
    https://github.com/dotnet/cli-lab/releases/download/1.1.122401/dotnet-core-uninstall.tar.gz

tar -zxf dotnet-core-uninstall.tar.gz -C ./dotnet-core-uninstall/
mkdir -p ./dotnet-core-uninstall/
mv dotnet-core-uninstall.tar.gz ./dotnet-core-uninstall/
tar -zxf dotnet-core-uninstall.tar.gz -C ./dotnet-core-uninstall/
cd ./dotnet-core-uninstall/
./dotnet-core-uninstall -h