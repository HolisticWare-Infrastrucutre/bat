@echo off

:: HKEY_CLASSES_ROOT[].sln[]ShellNew.reg

regedit HKEY_CLASSES_ROOT[].sln[]ShellNew.reg
	
xcopy /Y ^
	SolutionEmpty.sln ^
	%SYSTEMROOT%\ShellNew\

explorer ^
	%SYSTEMROOT%\ShellNew\

	
@IF %ERRORLEVEL% NEQ 0 PAUSE	