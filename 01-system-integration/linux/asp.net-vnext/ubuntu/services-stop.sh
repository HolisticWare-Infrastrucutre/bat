#!/bin/bash


# ubuntu and debian

service apache2 stop

sudo update-rc.d apache2 disable



#======================================================================
# OPTIONS

# sudo apt-get install chkconfig
# chkconfig –list
# chkconfig <service> off

# sudo apt-get install sysv-rc-conf