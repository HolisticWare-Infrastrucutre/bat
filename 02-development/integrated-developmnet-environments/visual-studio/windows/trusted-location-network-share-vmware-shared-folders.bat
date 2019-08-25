@echo off

:: Control Panel +/ Network and internet +/ Internet Options 
::			+/ Security tab +/ Sites +/ Advanced 
::				+/ Add:  file://vmware-host

:: run as Administrator!!!

set DIR_NETFXES=%WINDIR%\Microsoft.NET\Framework\

set NETFXES=^
	v1.0.3705 ^
    v1.1.4322 ^
    v2.0.50727 ^
    v3.0 ^
    v3.5 ^
    v4.0.30319 ^

dir %DIR_NETFXES%

for %%s IN (%NETFXES%) DO (
	echo %DIR_NETFXES%\%%s
	
	%DIR_NETFXES%\%%s\CasPol ^
		-m -ag 1 ^
		-url file://vmware-host* ^
		FullTrust 
		
	%DIR_NETFXES%\%%s\CasPol ^
		-m -ag 1 ^
		-url file://vmware-host/Shared%20Folders* ^
		FullTrust 

	%DIR_NETFXES%\%%s\CasPol ^
		-q -machine -addgroup 1 ^
		-url file://vmware-host/* ^
		FullTrust -name "VMWARE-HOST"
)
	
	
::===============================================================================
mkdir c:\Workingdir\

echo insert into csproj for Windows Metro App
echo  <PropertyGroup>
echo     <LayoutDir>C:\WorkingFolder\$(MSBuildProjectName)\$(Configuration)</LayoutDir>
echo   </PropertyGroup>

	
PAUSE
@IF %ERRORLEVEL% NEQ 0 PAUSE
 