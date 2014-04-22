echo off

echo installing Applications that can be installed silently/automatically/non-interactive

echo ==================================================================

ECHO.......................................................
ECHO Installing Windows Installer 3.x (needed for .net framework dotnefx.exe)
ECHO Please wait...
start "Windows Installer 3.1" /wait ^
      %rizroot%\sw\WindowsInstaller-KB893803-v2-x86.exe ^
      /passive ^
      /norestart ^
      /log:%rizroot%\sw\WindowsInstaller-KB893803-v2-x86.exe.log


::ECHO.......................................................
::ECHO Installing .net framework 2.0
::ECHO Please wait...
::start ".net framework 2.0" /wait ^
::      %rizroot%\sw\ms.net\2.0\redist\dotnetfx.exe ^
::      /q:a /c:"install.exe /qb" 

ECHO.......................................................
ECHO Installing .net framework 3.0
ECHO Please wait...

echo this is full package not bootstrapper no network needed!!!!
start ".net framework 3.0" /wait ^
      %rizroot%\sw\ms.net\3.0\redist\dotnetfx3.exe ^
      /qb ^
      /norestart

::echo this is bootstrapper network needed!!!!
::start ".net framework 3.0" /wait ^
::      %rizroot%\sw\ms.net\3.0\redist\dotnetfx3setup.exe ^
::      /q:a /c:"install.exe /qb" 

::ECHO.......................................................
::ECHO Installing Office XP Professional with Frontpage
::ECHO Please wait...
::start "Office XP professional" /wait ^
::      %systemdrive%\install\Applications\OfficeXP\PROPLUS.msi ^
::      /QB


ECHO.......................................................
ECHO Installing RIZ.DRM software
ECHO Please wait...
mkdir "%systemdrive%\Program Files\RIZ"
mkdir "%systemdrive%\Program Files\RIZ\DRM"
mkdir "%systemdrive%\Program Files\RIZ\DRM\CAS"
mkdir "%systemdrive%\Program Files\RIZ\DRM\CAS\2.0"
xcopy /s /y /I /H /R /K /F /V /C ^
      "%rizroot%\sw\CAS\CAS20 Full\Synth10_Linear\*" ^
      "%systemdrive%\Program Files\RIZ\CAS\2.0\" 

xcopy /s /y /I /H /R /K /F /V /C ^
      "%systemdrive%\Program Files\RIZ\CAS\2.0\CAS20Starter.exe" ^
      "C:\Documents and Settings\All Users\Start Menu\Programs\Startup"

ECHO.......................................................
ECHO Installing Security.AntiVirus.AVG
ECHO Please wait...
start "Security.AntiVirus.AVG" /wait ^
      %systemdrive%\sw\security\antivirus\avgas-setup-7.5.0.50.exe ^
      /qb ^
      /noreboot

ECHO.......................................................
ECHO Installing Security.AntiVirus.AVG
ECHO Please wait...
start "Security.AntiVirus.ClamWin" /wait ^
      %systemdrive%\sw\security\antivirus\avgas-setup-7.5.0.50.exe ^
      /qb ^
      /noreboot
