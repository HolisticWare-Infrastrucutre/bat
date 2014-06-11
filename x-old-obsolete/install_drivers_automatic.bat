echo off

echo installing Drivers that can be installed silently/automatically/non-interactive

echo ==================================================================

ECHO.......................................................
ECHO Installing INTEL MOTHERBOARD
ECHO Please wait...
start "Intel Motherboard 1" /wait ^
        %rizroot%\Drivers\motherboard\%motherboard%\chipset\infinst_autol.exe ^
        -a ^
        -s

::        -nolic ^
::        -noread ^
::        -nowel ^
::        -overall ^
::        -L0009 ^

ECHO.......................................................
start "Intel Motherboard 2" /wait ^
        %rizroot%\Drivers\motherboard\%motherboard%\chipset\infinst_autol\setup.exe ^
        -S

::        -nolic ^
::        -noread ^
::        -nowel ^
::        -overall ^
::        -L0009 ^
        
ECHO.......................................................
start "Intel nic drivers" /wait ^
        %rizroot%\Drivers\motherboard\%motherboard%\chipset\nic_ethernet\C78332-001.EXE ^
        -a ^
        -s

::winnt.exe ^
::        /u:%rizroot%\Drivers\IntelINF\INFAnswr.txt ^
::        /s:

ECHO.
ECHO.......................................................
ECHO Installing USB easydrvr DRIVERS
ECHO Please wait...
xcopy /s /y /I /H /R /K /F /V /C ^
      "%rizroot%\Drivers\USB\ezusb\Modified Drivers\ezusbdrv\lib\i386\checked\ezusb.sys" ^
      %systemroot%\system32\drivers\

