@echo off

APPS=^
	xamarin-studio ^
	xamarin ^
	xamarin-visualstudio ^
	visualstudiocommunity2013 ^
	visualstudio2013-update1 ^
	visualstudio2013-update2 ^
	visualstudio2013-update3 ^
	vs2013remotetools ^
	vs2013.vscommands ^
	visualstudio2013-installerprojects -pre ^
	visualstudicode ^
	xmlnotepad ^
	tinycc ^
	orwelldevcpp ^
	linqpad4 ^
	cs-script ^
	cshell ^
	ilspy ^
	dotpeek ^
	nunit ^
	swig ^
	visualleakdetector ^
	sharpdevelop ^
	monodevelop ^
	windows-sdk-8.0 ^
	windows-sdk-7.0 ^
	stylecop ^
	ncrunch2.vs2013 ^
	fiddler4 ^
	wireshark ^
	xenulinksleuth ^
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
	androidstudio ^
	kaxaml ^
	snoop ^
	sniff ^
	wpfinspector ^
	
	
	
for %%a IN (%APPS%) DO (
	echo %%a
	
::	choco install ^
)



@IF %ERRORLEVEL% NEQ 0 PAUSE	
