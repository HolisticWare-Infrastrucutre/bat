:@echo off

:: HKEY_CLASSES_ROOT[].c1.x.html[]ShellNew.reg

regedit HKEY_CLASSES_ROOT[].c1.x.htm[]ShellNew.reg
	
xcopy /y ^
	composite-c1-cms-content-template.c1.x.htm ^
	%SYSTEMROOT%\ShellNew\
	
xcopy /y ^
	composite-c1-cms-content-template.c1.x.html ^
	%SYSTEMROOT%\ShellNew\

explorer ^
	%SYSTEMROOT%\ShellNew\

@IF %ERRORLEVEL% NEQ 0 PAUSE	