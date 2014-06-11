echo off
echo flushing

ipconfig /release

arp -d
arp -d *
nbtstat -R
ipconfig /flushdns

echo reregistering
nbtstat -RR
ipconfig /registerdns

ipconfig /renew
ipconfig /all

::pause