#/bin/bash


sudo apt-get install -y \
    sudo

nano /etc/sudoers


sudo apt-get update -y 

#-------------------------------------------------------------------------
# guest additions install
apt-cache search linux-headers-$(uname -r)

sudo apt-get install -y \
    linux-headers-$(uname -r) \
    make \
    gcc

sudo sh /media/cdrom/autorun.sh
#-------------------------------------------------------------------------


#    gnome-tweak-tool \


git clone --recursive \
    https://github.com/moljac/bat.git


