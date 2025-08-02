#!/bin/bash

#Miljenkos-MacBook-Pro-16-2023-ARM-M2

#Miljenkos-MacBook-Pro-16-2024-ARM-M4

echo \
"
scutil --get ComputerName 
scutil --get HostName
scutil --get LocalHostName
hostname
dscacheutil -flushcache
"
scutil --get ComputerName 
scutil --get HostName
scutil --get LocalHostName
hostname
dscacheutil -flushcache


# export NAME_NEW=Miljenkos-MacBook-Pro-16-2024-ARM-M4
# scutil --set ComputerName   $NAME_NEW
# scutil --set HostName       $NAME_NEW
# scutil --set LocalHostName  $NAME_NEW
# sudo hostname               $NAME_NEW
# dscacheutil -flushcache
