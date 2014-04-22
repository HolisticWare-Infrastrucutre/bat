echo off

set REGKEY="HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles\Outlook"

REGEDIT /e ^
	.\account_settings.reg ^
	%REGKEY%

notepad  .\account_settings.reg

pause