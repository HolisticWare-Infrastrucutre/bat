#!/bin/bash

export ROOT=$HOME/Downloads/HolisticWare

rm -fr $ROOT

git \
    clone \
        --recursive \
            https://github.com/redth/ralphpilot \
            $ROOT/ai/ralph-copilot

cd $ROOT/ai/ralph-copilot/
dotnet pack
dotnet tool install -g --add-source ./src/RalphPilot/bin/Release RalphPilot
cd -