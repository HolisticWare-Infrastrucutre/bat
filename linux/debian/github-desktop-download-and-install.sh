#!/bin/bash

function vscode_download_and_install()
{
    wget \
        -O github-desktop.deb \
        https://github.com/gengjiawen/desktop/releases/download/v1.0.4-beta0/desktop_1.0.4-beta0_amd64.deb 

    sudo apt install -f
    sudo apt install -y \
        libappindicator1
   
    sudo dpkg -i github-desktop.deb
    sudo apt-get install -y -f # Install dependencies
    rm -fr github-desktop.deb
}

vscode_download_and_install

