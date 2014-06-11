:: Content on the DVDs is organized in such a way that it 
:: is easy to create your own CD-Rs from DVD. However, 
:: there are some things that must be paid attention to: 

:: Keep the path identical. For example, if the path to 
:: Windows XP Professional on a DVD is \English\WinXP\Pro\, 
:: be sure to put all of the files on the CD-R in the same 
:: path. 

:: If there are any files in the root of the DVD, be sure 
:: to put them in the root of your CD-R. 

:: The CD-R's volume label must match the DVD's volume label. 

:: CD-Rs can only be created and used in accordance with the 
:: MSDN Master End-User License Agreement (EULA). 

:: CD-Rs are unsupported by Microsoft Technical Support. 

:: Bootable CD images of operating systems are available from 
:: MSDN Subscriber Downloads. It is highly recommended you use 
:: these rather than try to create your own installation CD-Rs 
:: from DVD. 


:: dir where SP2 resides (downoladed or pointing to Cd)

set DVD_DRV=F:
set CD_PTH=D:\xp-cd
set DIR_OS_XP_PTH=ENGLISH\WINXP\PRO_SP1A
set DIR_OS_XP_SP2=e:\sw\ms
set DIR_OS_XP_NEW=%CD_PTH%\%DIR_OS_XP_PTH%
set DIR_OS_XP_OLD=%DVD_DRV%\%DIR_OS_XP_PTH%

:: Next copy Windows XP CD to hard drive. 
:: create a folder and copy all the contents of Windows XP CD 
:: in that folder
echo %DIR_XP_OS_NEW%
echo %DIR_XP_OS_OLD%


rmdir /s /q %CD_PTH%\

md %CD_PTH%
md %DIR_OS_XP_NEW%

:: Extract Microsoft Corporation.img from original boot CD
:: and copy it into DIR_OS_XP_NEW
"%ProgramFiles%\Smart Projects\IsoBuster\IsoBuster.exe"


xcopy /E  ^
	%DIR_OS_XP_OLD% ^
	%DIR_OS_XP_NEW%
xcopy ^
	%DVD_DRV%\*.* ^
	%CD_PTH%

:: SP2 just in case to have it on CD
md 	%CD_PTH%\SP2

xcopy %DIR_OS_XP_SP2%\WindowsXP-KB835935-SP2-ENU.exe ^
	%CD_PTH%\SP2

"%ProgramFiles%\Ahead\Nero\NeroCmd.exe"


pause

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
:: md %DIR_OS_XP_SP2%
%DIR_OS_XP_SP2%\WindowsXP-KB835935-SP2-ENU.exe ^
	/integrate:%DIR_OS_XP_NEW%

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
