#!/bin/bash

function vscode_download_and_install()
{
    wget \
        -O vscode.deb \
        https://go.microsoft.com/fwlink/?LinkID=760868 

    sudo dpkg -i vscode.deb
    sudo apt-get install -y -f # Install dependencies
}

vscode_download_and_install

