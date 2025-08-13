#!/bin/bash

dotnet --list-sdks

sudo rm -fr /usr/local/share/dotnet/sdk/9.0.*

sudo rm -fr /usr/local/share/dotnet/shared/Microsoft.NETCore.App/9.0.*
sudo rm -fr /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App/9.0.*

dotnet --list-sdks

dev_dotnet_workloads_reinstall 
