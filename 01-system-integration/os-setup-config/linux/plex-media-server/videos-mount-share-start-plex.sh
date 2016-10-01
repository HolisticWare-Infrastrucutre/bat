#/bin/bash

mount.exfat /dev/sdb1 /mnt/videos

/etc/init.d/plexmediaserver start

sudo service smb restart
sudo service nmb restart

