#!/bin/bash

function cake_install()
{
    # Windows

    # Invoke-WebRequest http://cakebuild.net/download/bootstrapper/windows -OutFile build.ps1
    
    # Linux

    # curl -Lsfo build.sh http://cakebuild.net/download/bootstrapper/linux
    
    # OS X

    curl -Lsfo build.sh http://cakebuild.net/download/bootstrapper/osx
    chmod +x ./build.sh
    ls -al ./build.sh
    ./build.sh

    alias cake_install
}

function cake_uninstall()
{
    rm -fr ./tools/
    rm -fr ./build.sh
}

function cake_run()
{
    # Windows

    # Invoke-WebRequest http://cakebuild.net/download/bootstrapper/windows -OutFile build.ps1
    
    # Linux
    # OS X

    mono tools/Cake/Cake.exe --verbosity=diagnostic --target=externals-android

    mono tools/Cake/Cake.exe --verbosity=diagnostic --target=libs
    
    open Twilio.sln
}

# basename "$0"
SCRIPTNAME=`basename "$0"`
SCRIPTNAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
echo running: $BASH_SOURCE

if [ ! -d "./tools/" ];
    then
        cake_install
fi    

cake_install
#alias cake_install 