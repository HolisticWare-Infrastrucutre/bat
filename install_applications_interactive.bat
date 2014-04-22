echo off
echo installing Applications that can not be installed silently/automatically/non-interactive
echo ==================================================================

ECHO.......................................................
ECHO Installing MOXA PcommLite Professional Serial Communication Tool for 
echo Windows 2000/XP/2003 (for x86 and x64)
echo Moxa PComm Lite - Serial Comm Development Tool
ECHO Please wait...
start "Moxa PComm Lite" /wait ^
        %rizroot%\Drivers\serial\moxa\PComm2K_V1.3\PCommLite2000\setup_pcommlite_1.3.exe ^
        /qn
