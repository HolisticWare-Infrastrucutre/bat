#!/bin/bash

function add_mono_project_GPG_signing_key_and_package_repository ()
{
	sudo apt-key \
		adv \
		--keyserver hkp://keyserver.ubuntu.com:80 \
		--recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
	echo "deb http://download.mono-project.com/repo/debian wheezy main" \
	| \
	sudo tee /etc/apt/sources.list.d/mono-xamarin.list
	sudo apt-get update
}



# call this to get newer mono version
# w/o this mono 3.2.8 wil be installed

add_mono_project_GPG_signing_key_and_package_repository

sudo apt-get install -y \
	mono-devel \
	mono-complete \
	monodevelop

mono -V

