::cd c:\windows\system32


::call netsh.set.bat netconfig.stonska.dcm.txt
set INTERFACE=^
	name="Local Area Connection"
::	local

netsh ^
	interface ip ^
	set address % ^
	%INTERFACE% ^
	10.5.145.21 255.255.255.0 10.5.145.11

::	source=static ^
::	addr=10.5.131.91 ^
::	mask=255.255.255.0 ^
::	gateway=10.5.131.2

netsh ^
	interface ip ^
	set dns ^
	%INTERFACE% ^
	10.5.131.33

pause

netsh diag gui


