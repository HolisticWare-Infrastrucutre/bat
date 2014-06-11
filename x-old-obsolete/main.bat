CLS
@echo off
TITLE Windows XP SP2 - Unattended Installation

ECHO.
ECHO echo RIZ.DRM custom setup by moljac++
ECHO ===============================================================
ECHO Over the next few minutes you will see automated installations 
ECHO of various sofware applications, windows updates, and registry
ECHO tweaks being implemented. The computer will restart automatically
ECHO once the whole process has finished!

echo %systemdrive%
echo %systemroot%

set rizroot=%systemdrive%\RIZ

set motherboard=SE7320SP2-SE7525G52
::set motherboard=S5000VSA

ECHO.
echo =============================================================================
ECHO Wallpapers and Screensavers (removing and installing)
DEL "%systemroot%\*.bmp"
DEL "%systemroot%\Web\Wallpaper\*.jpg"
DEL "%systemroot%\system32\dllcache\*.scr"
DEL "%systemroot%\system32\*.scr"

XCOPY /s /y /I /H /R /K /F /V /C ^
    "%rizroot%\GUI\riz_6.bmp" "%systemroot%\winnt256.bmp"
XCOPY /s /y /I /H /R /K /F /V /C ^
    "%rizroot%\GUI\riz_6.bmp" "%systemroot%\winnt.bmp"
XCOPY /s /y /I /H /R /K /F /V /C ^
     "%rizroot%\GUI\riz_6.bmp" "%systemroot%\"

XCOPY /s /y /I /H /R /K /F /V /C ^
     "%rizroot%\GUI\riz_6.bmp" "%systemroot%\Web\Wallpaper\Bliss.bmp"
XCOPY /s /y /I /H /R /K /F /V /C ^
     "%rizroot%\GUI\riz_6.bmp" "%systemroot%\Web\Wallpaper\"


ECHO.
echo =============================================================================
ECHO Removing useless shortcuts...
DEL "%systemdrive%\Documents and Settings\All Users\Start Menu\Windows Update.lnk"
DEL "%systemdrive%\Documents and Settings\All Users\Start Menu\Set Program Access and Defaults.lnk"
DEL "%systemdrive%\Documents and Settings\All Users\Start Menu\Windows Catalog.lnk"



ECHO.
echo =============================================================================
ECHO users removing/disabling
call %rizroot%\install\users.bat


ECHO.
echo =============================================================================
ECHO Applying Registry Tweaks...
REGEDIT /S %rizroot%\install\memory.reg
REGEDIT /S %rizroot%\install\GUI.reg
REGEDIT /S %rizroot%\install\filesystem.reg
REGEDIT /S %rizroot%\install\applications.reg


ECHO.
echo =============================================================================
call %rizroot%\install\install_drivers_automatic.bat
call %rizroot%\install\install_applications_automatic.bat
call %rizroot%\install\install_drivers_interactive.bat
call %rizroot%\install\install_applications_interactive.bat


ECHO.
echo =============================================================================
echo Removing empty directories if some of componets were not instaled
:: note \ at the end!!
:: this would be better to remove it from i386 folder, but that is
:: quiet a lot od job
rd /s /q "%systemdrive%\Program Files\xerox\"
rd /s /q "%systemdrive%\Program Files\Outlook Express\"
rd /s /q "%systemdrive%\Program Files\Net Meeting\"
rd /s /q "%systemdrive%\Program Files\Movie Maker\"
rd /s /q "%systemdrive%\Program Files\Messenger\"
rd /s /q "%systemdrive%\Program Files\Windows Media Player\"
rd /s /q "%systemdrive%\Program Files\msn gaming zone\"
rd /s /q "%systemdrive%\Program Files\microsoft frontpage\"
rd /s /q "%systemdrive%\Program Files\Internet Explorer\"
rd /s /q "%systemdrive%\Program Files\windows nt\"


ECHO.
echo =============================================================================
ECHO Activating XP hack!!
ECHO Please wait...
"%rizroot%\hackz\XP_ACTIVATORS\Windows_XP_Service_Pack_2_Activator\Win XP SP2 Activator.exe"

ECHO.
echo =============================================================================
ECHO Restarting the PC in 1 minute...
shutdown.exe -r -f -t 30 ^
    -c "Windows XP will now restart in 1 minute, this will give enough time for the shortcuts to update and for the shell to fully load before its ready to restart!"

ECHO.
echo =============================================================================
echo %rizroot% directory left for further customizations
::ECHO Deleting Temp Installation Files...
::RD /S /Q %rizroot%\
RD /S /Q %rizroot%\hackz\

::EXIT


set rizroot=
set motherboard=


::echo Bres eni ki
::pause

