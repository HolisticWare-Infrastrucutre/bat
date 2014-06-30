#!/bin/bash
	
# -----------------------------------------------------------------------------------
# CentOS 
#		6.5
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# user new
USER_SUDO=someuser
useradd $USER_SUDO 
passwd $USER_SUDO
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# user new as sudo-ers
chmod 600 /etc/sudoers	
echo $USER_SUDO ' ALL=(ALL) ALL' >> /etc/sudoers
chmod 400 /etc/sudoers
cat /etc/sudoers
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# prerequisites for building mono
sudo \
    yum -y install \
        gcc gcc-c++ automake autoconf autogen libtool make \
        bison gettext glib2 glibc-devel \
        bzip2 wget java unzip git \
        freetype fontconfig libpng libpng-devel libX11 libX11-devel glib2-devel \
        libgdi* libexif urw-fonts
# -----------------------------------------------------------------------------------
 

 
sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -I INPUT 5 -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -I INPUT 5 -i eth1 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
service iptables save
sudo service iptables restart

sudo iptables -L -n

sudo iptables-save | sudo tee /etc/sysconfig/iptables
sudo service iptables restart
