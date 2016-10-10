#!/bin/bash

# VMware Fusion
if [ -d "/Applications/VMware Fusion.app/Contents/Library" ]; then
    export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"
fi

vmrun list
vmrun start \
    ~/Documents/Virtual\ Machines.localized/Windows\ 8\ x64.vmwarevm/Windows\ 8\ x64.vmx