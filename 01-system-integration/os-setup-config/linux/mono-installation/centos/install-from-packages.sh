#!/bin/bash

sudo \
	rpm --import \
	"http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"

sudo \
	yum-config-manager --add-repo \
	http://download.mono-project.com/repo/centos/

sudo \
	yum install mono-complete
sudo \
	yum install apache2-mod_mono
sudo \
	yum install mono-basic
