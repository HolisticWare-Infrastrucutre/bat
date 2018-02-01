#/bin/bash

sudo add-apt-repository \
	ppa:alexlarsson/flatpak
sudo apt update
sudo apt install flatpak
flatpak
flatpak remote-add --from gnome https://sdk.gnome.org/gnome.flatpakrepo
flatpak install gnome org.freedesktop.Platform 1.4
flatpak install --user --bundle xs.flatpak


wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
wget https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip

uname -a
cd android-sdk-linux/
android

