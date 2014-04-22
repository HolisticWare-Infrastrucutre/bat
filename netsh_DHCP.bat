
:: http://www.intelliadmin.com/blog/2007/09/elevate-processes-from-command-prompt.html
:: http://www.walkernews.net/2007/05/21/open-command-prompt-here-with-elevated-privilege/
:: echo off

set version=
set ELEVATE=""

VER | findstr /i "5.0." > nul
IF %ERRORLEVEL% EQU 0 set version=2000

VER | findstr /i "5.1." > nul
IF %ERRORLEVEL% EQU 0 set version=XP

VER | findstr /i "5.2." > nul
IF %ERRORLEVEL% EQU 0 set version=2003

VER | findstr /i "6.0." > nul
IF %ERRORLEVEL% EQU 0 set version=Vista

echo %version%

if %version% == Vista set ELEVATE=c:\bin\elevate

echo version = %version%
echo OS      = %OS%
echo elevate = %ELEVATE%
echo ----------------------------------------------

set CONNECTION="Local Area Connection"

set TYPE_ADDRESS=dhcp
set TYPE_DNS=dhcp

%ELEVATE% ^
	netsh int ip reset c:\bat\netsh\resetlog.txt
%ELEVATE% ^
	netsh winsock reset

%ELEVATE% ^
	ipconfig /registerdns

%ELEVATE% ^
	ipconfig /flushdns

%ELEVATE% ^
	ipconfig /release

%ELEVATE% ^
	netsh interface ^
		ip set address ^
		name=%CONNECTION% ^
		%TYPE_ADDRESS%	

%ELEVATE% ^
	netsh interface ^
		ip set dns ^
		name=%CONNECTION% ^
		%TYPE_DNS%	

arp -d
arp -d *
nbtstat -R
%ELEVATE% ^
	ipconfig /flushdns

echo reregistering
nbtstat -RR

%ELEVATE% ^
	ipconfig /registerdns
%ELEVATE% ^
	ipconfig /renew
%ELEVATE% ^
	ipconfig /all

netsh -f %1
:: netsh diag gui
pause
  