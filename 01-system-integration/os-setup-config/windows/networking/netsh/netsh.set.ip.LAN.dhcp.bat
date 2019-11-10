::cd c:\windows\system32


netsh ^
	interface ip ^
	set address "Local Area Connection" dhcp

netsh ^
	interface ip ^
	set dns "Local Area Connection" dhcp

arp -d
arp -d *
nbtstat -R
ipconfig /flushdns

echo reregistering
nbtstat -RR
ipconfig /registerdns

ipconfig /renew
ipconfig /all

netsh diag gui


