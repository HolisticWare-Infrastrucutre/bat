#!/bin/bash

curl \
    -o dotnet-core-uninstall.tar.gz \
    -L \
    -v https://github.com/dotnet/cli-lab/releases/download/1.0.115603/dotnet-core-uninstall.tar.gz

curl \
    -o dotnet-core-uninstall.msi \
    -L \
    -v https://github.com/dotnet/cli-lab/releases/download/1.1.122401/dotnet-core-uninstall.tar.gz

ls -al

mkdir -p ./dotnet-core-uninstall
tar -zxf dotnet-core-uninstall.tar.gz -C ./dotnet-core-uninstall
cd ./dotnet-core-uninstall
./dotnet-core-uninstall -h

--runtime

Lists all .NET Core runtimes that can be uninstalled with this tool.

--sdk

Lists all .NET Core SDKs that can be uninstalled with this tool.

-v, --verbosity <LEVEL>

Sets the verbosity level. Allowed values are q[uiet], m[inimal], n[ormal], d[etailed], and diag[nostic]. The default value is normal.

./dotnet-core-uninstall \
    list \
    --sdk \
    --verbosity=d


./dotnet-core-uninstall dry-run --runtime   --all-previews
./dotnet-core-uninstall dry-run --sdk       --all-previews

sudo ./dotnet-core-uninstall remove --runtime   --all-previews
sudo ./dotnet-core-uninstall remove --sdk       --all-previews

cd ../


dotnet tool uninstall   -g cake.tool
dotnet tool install     -g cake.tool

dotnet tool uninstall   -g xamarin.androidbinderator.tool 
dotnet tool install     -g xamarin.androidbinderator.tool 

dotnet tool uninstall   -g xamarin.androidx.migration.tool 
dotnet tool install     -g xamarin.androidx.migration.tool 
