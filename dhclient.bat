echo off


set CONNECTION="Local Area Connection"

set TYPE_ADDRESS=dhcp
::set TYPE_ADDRESS=static 192.168.1.101 255.255.255.0 192.168.1.1

set TYPE_DNS=dhcp
::set TYPE_DNS=static 192.168.1.1 213

ipconfig /release

netsh interface ^
		ip set address ^
		name=%CONNECTION% ^
		%TYPE_ADDRESS%	

netsh interface ^
		ip set dns ^
		name=%CONNECTION% ^
		%TYPE_DNS%	

ipconfig /renew


ipconfig /all

::pause
set ELEVATE=""
set OS_VERSION=%SYSTEMDRIVE%\bat\os_version.bat
echo %OS_VERSION%

%ELEVATE% call %OS_VERSION%


if %version% == Vista set ELEVATE=elevate

echo version = %version%
echo OS      = %OS%
echo elevate = %ELEVATE%
echo ----------------------------------------------
