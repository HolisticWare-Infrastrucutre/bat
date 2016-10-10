@echo off

set APPS=^
	cropper ^
	paint.net ^
	gimp ^
	imagemagick ^
	optipng ^
	pngquant ^
	pnggauntlet ^
	pngout ^
	imageresizerapp ^
	imageconverter ^
	inkscape -pre ^
	newrelic.netagent ^
	vlc ^


::choco install %APPS%
cinst -y -verbose ^
	%APPS%

:: for %%a IN (%APPS%) DO (
:: 	echo %%a
::
:: 	:: choco install %%a
:: 	cinst -y -verbose ^
:: 			%%a
:: )

@IF %ERRORLEVEL% NEQ 0 PAUSE
