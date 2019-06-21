#!/bin/bash

# publishURL

URLS=\
"\
    https://go.microsoft.com/fwlink/?LinkID=620882 \
    https://www.visualstudio.com/thank-downloading-visual-studio-mac/?sku=vsmac \
    https://www.xamarin.com/download \
    https://slack.com/ssb/download-osx \
    https://update.gitter.im/osx/latest \
    http://b1.org/ \
    http://lightheadsw.com/caffeine/ \
    http://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/ \
    https://www.xquartz.org/ \
    https://inkscape.org/en/download/mac-os/ \
	http://launchpad.net/unetbootin/trunk/625/+download/unetbootin-mac-625.dmg \
	http://support.logitech.com/en_us/product/unifying \
    http://sourceforge.net/projects/octave/files/Octave%20MacOSX%20Binary/2013-12-30%20binary%20installer%20of%20Octave%203.8.0%20for%20OSX%2010.9.1%20%28beta%29/ \

    jadx
    jadx-gui
    jd-gui
    luyten    
"    

open $URLS

brew install protobuf
# for error messages, run 
brew doctor
# follow any recommended fixes, and try again. 
# If it still fails, try instead:
brew upgrade protobuf

URL=https://github.com/google/protobuf/archive/master.zip
echo downloading: $URL
curl \
    -v -L -C - \
    -o protobuf.zip \
    -O $URL
unzip protobuf.zip 
cd protobuf-master/
./autogen.sh && ./configure && make
make check
sudo make install
which protoc
protoc --version
cd ..

#PROTOC_ZIP=protoc-3.3.0-osx-x86_64.zip
#curl -OL https://github.com/google/protobuf/releases/download/v3.3.0/$PROTOC_ZIP
#sudo unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
#rm -f $PROTOC_ZIP


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
    -o dotnet-sdk.zip \
    -O \
        https://dl.bintray.com/xquartz/downloads/XQuartz-2.7.11.dmg
curl \
    -v -L -C - \
    -o dotnet-sdk.zip \
    -O \
        https://inkscape.org/en/gallery/item/3896/Inkscape-0.91-1-x11-10.7-x86_64.dmg
