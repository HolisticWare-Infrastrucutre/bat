#!/bin/bash


sudo zypper \
    install -y \
    libicu
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
wget \
    https://packages.microsoft.com/config/opensuse/15/prod.repo \
    -O prod.repo
sudo mv prod.repo /etc/zypp/repos.d/microsoft-prod.repo
sudo chown root:root /etc/zypp/repos.d/microsoft-prod.repo

sudo zypper \
    install -y \
    dotnet-sdk-3.1 \
    aspnetcore-runtime-3.1 \
    dotnet-runtime-3.1 \

