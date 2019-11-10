
dir ^
	%WINDIR%\ShellNew\

dir ^
	.\
	
echo ===========================================================================

c:\bin\elevate.exe -k ^
	xcopy ^
	.\*.sln ^
	%WINDIR%\ShellNew\
	
dir ^
	%WINDIR%\ShellNew\

@IF %ERRORLEVEL% NEQ 0 PAUSE
	