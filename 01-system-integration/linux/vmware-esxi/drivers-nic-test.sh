#!/bin/bash

lspci -v | less
lspci -n |grep xx:xx

# ESXI
vmkload_mod -l |grep drivername
# ESX
rpm -qa | grep drivername

esxcfg-nics -l