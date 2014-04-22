echo off
echo installing Drivers that can not be installed silently/automatically/non-interactive
echo ==================================================================

ECHO.......................................................
ECHO Installing INTEL nic drivers
ECHO Please wait...
start "Intel nic drivers interactive" /wait ^
        %rizroot%\Drivers\motherboard\%motherboard%\chipset\nic_ethernet\intel-lan_msft_v11.1_whql\apps\setup\SETUPBD\Win32\setupbd.exe ^
        /qn

ECHO.......................................................
ECHO Installing MOXA DRIVERS
echo Please wait

ECHO.......................................................
ECHO Installing TouchPanel drivers
ECHO Please wait...
start "TouchPanel Utilities" /wait ^
      %rizroot%\Drivers\video\Win2000_XP_3.2.1.2925\Win2000_XP\Setup.exe ^
      /qn
