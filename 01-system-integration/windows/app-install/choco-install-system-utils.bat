@echo off

set APPS=^
	chocolateygui ^
	filezilla ^
	powershell ^
	dotnet3.5 ^
	dotnet4.5 ^
	dotnet4.5.1 ^
	dotnet4.5.2 ^
	jre8 ^
	javaruntime ^
	msysgit ^
	tortoisegit ^
	tortoisesvn ^
	tortoisehg ^
	ccleaner ^
	sysinternals ^
	spybot ^
	superantispyware ^
	malwarebytes ^
	fastcopy ^
	windows-tweaker.install ^
	daemontoolslite ^
	ultraiso ^
	magicdisc ^
	isorecorder ^
	virtualclonedrive ^
	putty ^
	superputty ^
	nuget.commandline ^
	procexp ^
	perfview ^
	mysql.workbench ^
	wget ^
	curl ^
	winscp ^
	teamviewer ^
	cygwin ^
	youtube-dl ^
	console2 ^
	virtualbox ^
	googledrive ^
	dropbox ^




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
