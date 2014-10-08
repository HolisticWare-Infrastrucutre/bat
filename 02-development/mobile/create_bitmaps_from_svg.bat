@echo off
echo Converting SVG files to PNGs
echo Warning: Do not use filenames with whitespace!!!


setlocal EnableDelayedExpansion 

set OPTIPNG=c:\bin\optipng\optipng.exe

%OPTIPNG%

FOR /F "tokens=*" %%s IN ('dir /s /b ..\*.svg') DO (
	echo =======================================================================
	set FILENAME_PATH_SVG=%%s
	set FILENAME=%%~ns
	set FILENAME_W_EXT=%%~nxs
	::set DIRNAME=!FILENAME_PATH:.svg=!  No renaming
	set DIRNAME="!FILENAME_PATH_SVG!.holisticware-generated"

	echo FILENAME_PATH_SVG=!FILENAME_PATH_SVG!
	echo FILENAME=!FILENAME!
	echo FILENAME_W_EXT=!FILENAME_W_EXT!
	echo DIRNAME="!DIRNAME!"
	
	echo "Creating Directory - surrounded with "" in the case of whitespace"
	echo "Working with full path!"
	rmdir /q /s "!DIRNAME!"
	mkdir "!DIRNAME!"

	echo ----------------------------------------------------
	identify "!FILENAME_PATH_SVG!"
	
	echo ----------------------------------------------------
	set PLATFORM=windows-phone
	echo PLATFORM=!PLATFORM!
	
	mkdir "!DIRNAME!\!PLATFORM!"
		
	set SIZE=62x62
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
	
		
	set SIZE=173x173
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=99x99
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=200x200
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
	


	echo ----------------------------------------------------
	set PLATFORM=android
	echo PLATFORM=!PLATFORM!

	mkdir "!DIRNAME!"\!PLATFORM!\
	
	set SIZE=36x36
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=48x48
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=72x72
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=96x96
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=19x19
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=25x25
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=38x38
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"

	set SIZE=24x24
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"

	set SIZE=32x32
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	echo ----------------------------------------------------
	set PLATFORM=ios
	echo PLATFORM=!PLATFORM!

	mkdir "!DIRNAME!"\!PLATFORM!\
	
	set SIZE=57x57
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"

	set SIZE=114x114
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=72x72
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=28x28
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
		
	set SIZE=58x58
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"

	set SIZE=50x50
	convert ^
		"!FILENAME_PATH_SVG!" ^
		-resize !SIZE! ^
		"!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png"
	
)

pause



	%OPTIPNG% ^
		-log "!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.png.log" ^
		-out "!DIRNAME!\!PLATFORM!\!FILENAME!.!SIZE!.opt.png" ^
		"!DIRNAME!\!FILENAME!.!SIZE!.opt.png"

:: Howtos!!!!!!!!!!!!!!!


:: http://commandwindows.com/tipsandtricks.htm

:: echo %mA% %mB% %mC% %mD%
:: and all the variables translate to an empty string, because none of 
:: them have been set. In that case, the command is actually just this:
:: 	          echo


:: Variable substitution
:: %~I         - expands %I removing any surrounding quotes (")
:: %~fI        - expands %I to a fully qualified path name
:: %~dI        - expands %I to a drive letter only
:: %~pI        - expands %I to a path only
:: %~nI        - expands %I to a file name only
:: %~xI        - expands %I to a file extension only
:: %~sI        - expanded path contains short names only
:: %~aI        - expands %I to file attributes of file
:: %~tI        - expands %I to date/time of file
:: %~zI        - expands %I to size of file
:: %~$PATH:I   - searches the directories listed in the PATH
::                environment variable and expands %I to the
::                fully qualified name of the first one found.
::                If the environment variable name is not
::                defined or the file is not found by the
::                search, then this modifier expands to the
::                empty string		   
			   
			   
	   
::delayed expansion