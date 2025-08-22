#!/bin/zsh

  echo "--------------------------------------------------------------------------------------------"
  echo \
  "
  sudo rm -fr \
      /usr/local/share/dotnet/sdk/* \
      /usr/local/share/dotnet/sdk-manifests/* \
      /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App/* \
      /usr/local/share/dotnet/shared/Microsoft.NETCore.App/* \
  "

sudo \
    rm -fr \
        /usr/local/share/dotnet/sdk/* \
        /usr/local/share/dotnet/sdk-manifests/* \
        /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App/* \
        /usr/local/share/dotnet/shared/Microsoft.NETCore.App/* \

  echo "--------------------------------------------------------------------------------------------"
