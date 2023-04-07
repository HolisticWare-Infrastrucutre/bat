#!/bin/bash

# publishURL

URLS=\
"\
    http://www.sourcegear.com/diffmerge/downloaded.php
    https://github.com/skylot/jadx
    https://bintray.com/skylot/jadx/releases/v1.0.0#files
    http://java-decompiler.github.io/
    https://github.com/deathmarine/Luyten
    https://bitbucket.org/mstrobel/procyon/src/default/
    https://www.benf.org/other/cfr/
"    

URLS=\
"\
    https://git-fork.com/update/files/Fork.dmg \
    https://git-fork.com/update/win/ForkInstaller.exe \
    https://www.git-tower.com/download/mac \
    https://www.git-tower.com/download/windows \
"


open $URLS





URL=https://github.com/faniereynders/dotnet-sdk-helpers/archive/master.zip
echo downloading: $URL
curl \
    -v -L -C - \
    -o dotnet-sdk.zip \
    -O $URL
unzip dotnet-sdk.zip 
cd ./dotnet-sdk-helpers-master/
chmod +x ./dotnet-sdk
./dotnet-sdk list
cp -f ./dotnet-sdk ~/bin/
rm -f /usr/local/bin/dotnet-sdk 
ln -s /Users/moljac/bin/dotnet-sdk /usr/local/bin/
dotnet sdk
dotnet sdk list


# https://www.xquartz.org/
curl \
    -v -L -C - \
    -o XQuartz.dmg \
    -O \
        https://dl.bintray.com/xquartz/downloads/XQuartz-2.7.11.dmg
curl \
    -v -L -C - \
    -o Inkscape.dmg \
    -O \
        https://inkscape.org/en/gallery/item/3896/Inkscape-0.91-1-x11-10.7-x86_64.dmg
