#/bin/bash

sudo \
	lspci -k | grep -A 3 -i "network"
sudo \
	yum install -y b43-fwcutter
sudo \
	yum install -y wget
sudo \
	wget http://downloads.openwrt.org/sources/broadcom-wl-4.150.10.5.tar.bz2
sudo \
	tar xjf broadcom-wl-4.150.10.5.tar.bz2
sudo \
	cd broadcom-wl-4.150.10.5/driver
sudo \
	b43-fwcutter -w /lib/firmware wl_apsta_mimo.o


sudo \
	reboot

