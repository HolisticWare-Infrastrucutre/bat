#!/bin/zsh

cd $HOME/Downloads/

rm -fr  ./Mono.ApiTools.NuGetDiff-master
rm      Mono.ApiTools.NuGetDiff-master.zip
curl \
    -v -L -C - \
    -o Mono.ApiTools.NuGetDiff-master.zip \
    -O \
        https://codeload.github.com/mattleibow/Mono.ApiTools.NuGetDiff/zip/refs/heads/master

unzip \
    -o \
    ./Mono.ApiTools.NuGetDiff-master.zip

cd ./Mono.ApiTools.NuGetDiff-master
dotnet cake


dotnet tool \
    uninstall \
        api-tools \
            --global \



dotnet tool \
    install \
        api-tools \
            --global \
            --add-source ./output/ \
            --ignore-failed-sources \
            --prerelease \


cd -
