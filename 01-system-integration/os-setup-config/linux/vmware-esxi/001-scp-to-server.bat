echo off

call .\000_environment_network_set.data.bat

echo ADDRESS_SERVER_INTERNAL = %ADDRESS_SERVER_INTERNAL%
echo ZPRK = %ZPRK%

c:\bin\putty\pscp.exe ^
	-p ^
	-r ^
	-v ^
	-scp ^
	-l root ^
	-pw %ZPRK% ^
	.\NIC\*.vib ^
	%ADDRESS_SERVER_INTERNAL%:/vmfs/volumes/datastore1/drivers-nic-realtek/

@IF %ERRORLEVEL% NEQ 0 PAUSE	
