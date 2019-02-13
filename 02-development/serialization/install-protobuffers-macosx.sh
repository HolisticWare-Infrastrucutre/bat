#!/bin/bash

# https://github.com/protocolbuffers/protobuf
# https://github.com/protocolbuffers/protobuf/releases

export URL=https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.zip
curl -v -L -C - -O $URL
export URL=https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-csharp-3.6.1.zip
curl -v -L -C - -O $URL
export URL=https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-osx-x86_64.zip
curl -v -L -C - -O $URL

unzip protobuf-all-3.6.1.zip
unzip protobuf-csharp-3.6.1.zip
unzip protoc-3.6.1-osx-x86_64.zip

brew install \
    autoconf \
    automake \

cd 

./autogen.sh 
./configure 
make
make check

./src/protoc --version

sudo make install

which protoc
protoc --version
protoc
