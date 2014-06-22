echo off

call .\000_environment_network_set.bat

echo ADDRESS_PBX_INTERNAL = %ADDRESS_PBX_INTERNAL%
echo ZPRK = %ZPRK%
::pause

c:\bin\putty\pscp.exe ^
	-p ^
	-r ^
	-v ^
	-scp ^
	-l root ^
	-pw %ZPRK% ^
	.\01-pbx\root\tftpboot\20140619\*.cfg ^
	%ADDRESS_PBX_INTERNAL%:/tftpboot/

	
