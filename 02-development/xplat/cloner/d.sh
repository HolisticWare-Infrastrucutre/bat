#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR


export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.WebSite.Notes.git"
export DIR="./HolisticWare.WebSite.Notes/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/moljac/bin.macosx.git"
export DIR="./bin/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export DIR="./bin//dotnet/"
mkdir $DIR
cd $DIR

# https://devblogs.microsoft.com/dotnet/announcing-the-net-core-uninstall-tool-1-0/
# https://github.com/dotnet/cli-lab/releases
# https://dev.to/marcusturewicz/remove-old-net-versions-with-the-new-uninstall-tool-1kmb

curl -O \
    https://github.com/dotnet/cli-lab/releases/download/1.1.122401/dotnet-core-uninstall-1.1.122401.msi \
    --output dotnet-core-uninstall.msi 
curl -O \
    https://github.com/dotnet/cli-lab/releases/download/1.1.122401/dotnet-core-uninstall.tar.gz \
    --ouput dotnet-core-uninstall.tar.gz

mkdir -p ./dotnet-core-uninstall
tar -zxf dotnet-core-uninstall.tar.gz -C ./dotnet-core-uninstall
cd ./dotnet-core-uninstall
./dotnet-core-uninstall -h



cd $DIR_ROOT