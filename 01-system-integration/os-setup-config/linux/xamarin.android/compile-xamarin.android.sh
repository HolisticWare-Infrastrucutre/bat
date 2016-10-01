#!/bin/bash


sudo apt-get -y install nuget

sudo mozroots --import --machine --sync
sudo certmgr -ssl -m https://go.microsoft.com
sudo certmgr -ssl -m https://nugetgallery.blob.core.windows.net
sudo certmgr -ssl -m https://nuget.org



git clone --recursive \
    https://github.com/moljac/xamarin-android.git


cd xamarin-android
make prepare


nuget restore -verbosity detailed -verbosity detailed

WARNING: Error getting response stream 
(Write: The authentication or decryption has failed.): SendFailure





