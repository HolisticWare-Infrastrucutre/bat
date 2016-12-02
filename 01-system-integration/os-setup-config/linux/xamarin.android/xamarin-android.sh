#!/bin/bash


# install FlatPak. Exact methods differ between distributions 
# see http://flatpak.org/getting.html

# FlatPak repository, which contains the OS image we run on top of: a. 

wget https://sdk.gnome.org/keys/gnome-sdk.gpg
flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/

# Install the base OS image:
flatpak install gnome org.freedesktop.Platform 1.4 5. 

# Download the latest Xamarin Studio installer bundle, currently at 
wget http://download.mono-project.com/test/XamarinStudio-6.1.0.5441.flatpak

# Install it to your user account:
flatpak install --user --bundle XamarinStudio-6.1.0.5441.flatpak

# Run Xamarin Studio 
#   from your distribution's app launcher menu 
# or on the command line
#   with flatpak run com.xamarin.Studio 
