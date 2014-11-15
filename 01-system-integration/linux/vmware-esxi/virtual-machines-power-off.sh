#!/bin/bash

# https://github.com/sixdimensionalarray/esxidown

vim-cmd vmsvc/getallvms

vim-cmd vmsvc/power.shutdown	80
vim-cmd vmsvc/power.shutdown	96
vim-cmd vmsvc/power.shutdown	112
vim-cmd vmsvc/power.shutdown	128
vim-cmd vmsvc/power.shutdown	144

vim-cmd vmsvc/power.off 	80
vim-cmd vmsvc/power.off 	96
vim-cmd vmsvc/power.off 	112
vim-cmd vmsvc/power.off 	128
vim-cmd vmsvc/power.off 	144


# 3) 
#	enter maintenance mode (immediately with no delay, this can only 
#	be done if ALL guest VMs have been shut down)
esxcli system maintenanceMode set -e true -t 0 

# 4) 
#	shutdown the ESXi host server# 
esxcli system shutdown poweroff -d 10 -r "Shell initiated system shutdown"

# 5) 
#	try to exit maintenance mode real quick before shutdown!
esxcli system maintenanceMode set -e false -t 0
