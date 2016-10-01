#/bin/bash

sudo yum install -y	\
	samba samba-client samba-common


# Check the version of installed samba software by using this command:

smbd --version

# Configure the samba service, so that, it will start automatically at boot time:

sudo chkconfig smb on
sudo chkconfig nmb on



# Disable the SELinux:
# sudo nano /etc/selinux/config
# change SELinux from enforcing to disabled:
# SELINUX=disabled


# Add these Iptables rules for SM:

sudo iptables -I INPUT 4 -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT
sudo iptables -I INPUT 5 -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT
sudo iptables -I INPUT 6 -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT

sudo service smb restart
sudo service nmb restart




sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo rm /etc/samba/smb.conf
sudo touch /etc/samba/smb.conf
#sudo nano /etc/samba/smb.conf



sudo rm /etc/samba/smb.conf
echo "
#======================= Global Settings =====================================
[global]
 workgroup = WORKGROUP
 security = share
 map to guest = bad user
#============================ Share Definitions ==============================
[Videos]
 path = /mnt/videos
 browsable =yes
 writable = yes
 guest ok = yes
 read only = no
 " >> /etc/samba/smb.conf
 
 cat /etc/samba/smb.conf
 
sudo service smb restart
sudo service nmb restart

