@echo off

:: http://blogs.msdn.com/b/visualstudio/archive/2010/07/06/debugging-msbuild-script-with-visual-studio.aspx

:: enable the undocumented "/debug" switch on MSBuild.exe by setting
reg add ^
	"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSBuild\4.0" ^
	/v DebuggerEnabled ^
	/d true
	
:: Run MSBuild and new switch should appear	
MSBuild /? 	


:: This sample was related to debugging some csproj references
:: http://lists.ximian.com/pipermail/mono-devel-list/2015-January/042566.html
:: http://www.mono-project.com/archived/porting_msbuild_projects_to_xbuild/#platform-specific-items
:: https://github.com/mono/mono/blob/master/mcs/class/Microsoft.Build.Tasks/Microsoft.Build.Tasks-net_4_5.csproj
::
::  <Choose>
::    <When Condition=" '$(OS)' == 'Unix' ">
::      <ItemGroup>
::        <Reference Include="Mono.Posix" />
::      </ItemGroup>
::    </When>
::  </Choose>
