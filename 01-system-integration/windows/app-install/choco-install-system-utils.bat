@echo off

set APPS=^
	msysgit ^
	tortoisegit ^
	tortoisesvn ^
	tortoisehg ^
	ccleaner ^
	sysinternals ^
	fastcopy ^
	windows-tweaker.install ^
	daemontoolslite ^
	ultraiso ^
	magicdisc ^
	isorecorder ^
	virtualclonedrive ^
	putty ^
	superputty ^
	
	
::	newrelic.netagent ^

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
