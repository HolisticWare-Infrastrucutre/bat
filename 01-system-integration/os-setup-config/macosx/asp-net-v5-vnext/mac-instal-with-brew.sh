#!/bin/bash

# http://developer.telerik.com/featured/write-c-mac-like-champ/


# unistall
brew untap aspnet/k
# install
brew tap aspnet/k
brew update

brew install kvm
kpm
source kvm.sh

kvm upgrade


kpm restore
k web
