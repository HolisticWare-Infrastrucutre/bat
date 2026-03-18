#!/bin/bash

# https://download.virtualbox.org/virtualbox/

# sudo apt-get install virtualbox-guest-dkms
#sudo apt-get install virtualbox-guest-additions-iso


sudo apt-get install gdebi-core


sudo apt-get install git

# https://oneuptime.com/blog/post/2026-01-15-install-visual-studio-code-ubuntu/view
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code


sudo apt-get update \
&& \
sudo apt-get install -y dotnet-sdk-10.0

dotnet workload install aspire

dotnet tool install --global aspire.cli

dotnet new install Aspire.ProjectTemplates


sudo apt install nodejs
sudo apt install npm 
npm install -g pnpm@latest


sudo apt-get update #
&& 
sudo apt-get install -y \
    python3.13 \
    python3-pip \
    python3.13-venv


# https://dev.to/danyson/how-to-install-github-desktop-for-ubuntu-debian-4hko

wget https://github.com/shiftkey/desktop/releases/download/release-3.4.13-linux1/GitHubDesktop-linux-arm64-3.4.13-linux1.deb
sudo gdebi GitHubDesktop-linux-arm64-3.4.13-linux1.deb



wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.7.3/gcm-linux-arm64-2.7.3.deb
sudo gdebi gcm-linux-arm64-2.7.3.deb

git-credential-manager configure
git config --global credential.credentialStore secretservice
