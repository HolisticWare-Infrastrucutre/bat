#!/bin/bash

sudo su
yum install scons gcc -y
yum install fuse-devel -y
yum install rpmbuild -y



wget \
	http://download1.rpmfusion.org/free/el/updates/6/x86_64/exfat-utils-1.0.1-2.el6.x86_64.rpm
wget \
	http://download1.rpmfusion.org/free/el/updates/6/x86_64/fuse-exfat-1.0.1-2.el6.x86_64.rpm

rpm -Uvh exfat-utils-1.0.1-2.el6.x86_64.rpm 
rpm -Uvh fuse-exfat-1.0.1-2.el6.x86_64.rpm

yum list "compat-libstdc*"


yum install "compat-libstdc++-33.i686" "compat-libstdc++-33.x86_64"











wget http://download1.rpmfusion.org/free/el/updates/6/SRPMS/exfat-utils-1.0.1-2.el6.src.rpm
wget http://download1.rpmfusion.org/free/el/updates/6/SRPMS/fuse-exfat-1.0.1-2.el6.src.rpm


rpm -ivh fuse-exfat-1.0.1-2.el6.src.rpm exfat-utils-1.0.1-2.el6.src.rpm
cd ./rpmbuild/SPECS
rpmbuild -ba fuse-exfat.spec
rpmbuild -ba exfat-utils.spec
cd ../RPMS/x86_64/
rpm -ivh fuse-exfat-1.0.1-2.el6.x86_64.rpm exfat-utils-1.0.1-2.el6.x86_64.rpm
ln -s /usr/sbin/mount.exfat /sbin/mount.exfat

