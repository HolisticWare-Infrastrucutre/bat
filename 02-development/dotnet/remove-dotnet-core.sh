#!/bin/bash


export VERSIONS=\
"
3.0.0-preview-27122-01
3.0.0-preview-27324-5
3.0.100-preview-010184
3.0.100-preview-009812
3.0.0-preview-18579-0056
3.0.0-preview-19075-0444
2.1.0-preview2-26406-04
2.1.0-preview2-final
"

for VERSION in $VERSIONS;
do
    echo ===================================================================
    echo removing dotnet core version = $VERSION
    sudo rm -rf /usr/local/share/dotnet/sdk/$VERSION
    sudo rm -rf /usr/local/share/dotnet/shared/Microsoft.NETCore.App/$VERSION
    sudo rm -rf /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App/$VERSION
    sudo rm -rf /usr/local/share/dotnet/host/fxr/$VERSION

done



dotnet --list-sdks 
dotnet --list-runtimes

