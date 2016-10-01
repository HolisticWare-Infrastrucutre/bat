#!/bin/bash

function add_dotnet_core_package_repository ()
{
	sudo sh -c \
	'echo \
	"deb [arch=amd64] \
		http://apt-mo.trafficmanager.net/repos/dotnet/ trusty main" \
	> \
	/etc/apt/sources.list.d/dotnetdev.list'

	sudo apt-key \
		adv \
		--keyserver apt-mo.trafficmanager.net --recv-keys 417A0893

	sudo apt-get update
}



add_dotnet_core_package_repository

sudo apt-get install -y \
	dotnet=1.0.0.001598-1 \




