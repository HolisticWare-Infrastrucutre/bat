@echo off

set APPS=^
	wget ^
	curl ^
	winscp ^
	putty ^
	superputty ^
	wireshark ^
	fiddler4 ^
	fiddler ^
	microsoft-message-analyzer ^
	
	



::choco install %APPS%
cinst -y -verbose ^
	%APPS%

for %%a IN (%APPS%) DO (
	echo %%a

	:: choco install %%a
	cinst -y -verbose ^
			%%a
)

@IF %ERRORLEVEL% NEQ 0 PAUSE
