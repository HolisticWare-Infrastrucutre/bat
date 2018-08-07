#!/bin/bash -e

export EMAIL=mcvjetko@holisticware.net
export USER=moljac

mkdir vc
mkdir vc/xamarin/
cd vc/xamarin

# Lists the files in your .ssh directory, if they exist
ls -al ~/.ssh
ssh-keygen -t rsa -b 4096 -C "$EMAIL"
#Start the ssh-agent in the background.
eval "$(ssh-agent -s)"

sudo apt-get install xclip
# Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer (like `yum`)
xclip -sel clip < ~/.ssh/id_rsa.pub
# Copies the contents of the id_rsa.pub file to your clipboard

$ git config --global user.name "$USER"
$ git config --global user.email $EMAIL

# Turn on the credential helper so that Git will save your password in memory for some time. 
# By default, Git will cache your password for 15 minutes.
# Set git to use the credential memory cache
git config --global credential.helper cache

# Set the cache to timeout after 1 hour (setting is in seconds)
# To change the default password cache timeout, enter the following:
git config --global credential.helper 'cache --timeout=3600'

    git clone --recursive \
        https://github.com/mono/monodevelop.git

    # MonoDevelop Addins arw private reop so copying it from other location
    cp -r /home/parallels/vc/xamarin/md-addins/ ./


    # do not pull the repos
    sh ./build-xs.sh --no-pull

