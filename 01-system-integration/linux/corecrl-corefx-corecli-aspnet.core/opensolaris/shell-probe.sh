#!/bin/bash

	PACKAGE_MANAGER=/opt/csw/bin/pkgutil

	pkgadd -d http://get.opencsw.org/now
	
	sudo $PACKAGE_MANAGER -U
	sudo $PACKAGE_MANAGER -y -i \
			xz \

	/usr/sbin/pkgchk -L \
			CSWxz \
			