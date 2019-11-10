#!/bin/bash

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y \
    update
sudo apt-get -y \
    install \
      oracle-java8-installer



sudo apt-get -y \
    install \
      vim-common


git clone --recursive \
	https://github.com/moljac/xamarin-android.git

cp Configuration.Override.props.in Configuration.Override.props

