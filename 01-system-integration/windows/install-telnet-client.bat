@echo off


pkgmgr /iu:"TelnetClient"


@IF %ERRORLEVEL% NEQ 0 PAUSE	
