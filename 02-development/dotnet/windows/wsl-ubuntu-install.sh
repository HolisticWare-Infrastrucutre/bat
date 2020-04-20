#!/bin/bash

wsl-ubuntu-install.sh 

sudo dpkg --purge packages-microsoft-prod && sudo dpkg -i packages-microsoft-prod.deb
wget \
    https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb \
    -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get \
    update
sudo apt-get \
    install -y\
    apt-transport-https
sudo apt-get \
    update
sudo apt-get \
    install -y\
    dotnet-sdk-3.1 \
    aspnetcore-runtime-3.1 \
    dotnet-runtime-3.1 \



