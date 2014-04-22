
:: dir where SP2 resides (downoladed or pointing to Cd)
set DIR_SP2=d:\sp2

set DIR_OS_XP_NEW=d:\xp-cd
set DIR_OS_XP_OLD=F:\ENGLISH\WINXP\PRO_SP1A
set DIR_OS_XP_SP2=E:\sw\ms
set DIR_IMAGE=d:\image

:: Next copy Windows XP CD to hard drive. 
:: create a folder and copy all the contents of Windows XP CD 
:: in that folder
echo %DIR_XP_OS_NEW%
echo %DIR_XP_OS_OLD%

md %DIR_OS_XP_NEW%
xcopy /E  ^
	%DIR_OS_XP_OLD% ^
	%DIR_OS_XP_NEW%

:: service pack 2 integration process does not automatically
:: remove some service pack 1 files from the integrated 
:: installation.  -  
del \SPNOTES.HTM  
del \WIN51IC.SP1  
del \I386\SP1.CAB
del \I386\SP1.CAT
del \I386\SVCPACK.INF
del \I386\SVCPACK\  
del \I386\HOTFIXES\

If \I386\SVCPACK.IN_ does not exist it may need to be acquired from a non-integrated Microsoft® Windows® XP installation CD. 
del 	

pause

:: integrate Service Pack with OS in new OS folder
::md %DIR_OS_XP_SP2%
%DIR_OS_XP_SP2%\WindowsXP-KB835935-SP2-ENU.exe ^
	/integrate:%DIR_OS_XP_NEW%

pause

:: Extract Microsoft Corporation.img from original boot CD
"%ProgramFiles%\Smart Projects\IsoBuster\IsoBuster.exe"
pause

net
"%ProgramFiles%\Ahead\Nero\NeroCmd.exe" ^

pause

rmdir /s /q %DIR_IMAGE%
::rmdir /s /q %DIR_OS_XP_OLD%
rmdir /s /q %DIR_OS_XP_NEW%
::rmdir /s /q %DIR_OS_XP_SP2%

set DIR_OS_XP_NEW=
set DIR_OS_XP_OLD=
set DIR_OS_XP_SP2=
set DIR_SP2=
set DIR_IMAGE=
