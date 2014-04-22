mkdir c:\temp

.\dotnetfx.11.redist.exe ^
	/q ^
	/t:c:\temp\

.\dotnetfx.11.sp1.full.NDP1.1sp1-KB867460-X86.exe ^
	/q ^
	/t:c:\temp\

.\dotnetfx.20.redist.exe ^
	/q ^
	/t:c:\temp\

.\dotnetfx.20.SP1_x86.exe ^
	/q ^
	/t:c:\temp\

.\dotnetfx.30.redist.full.exe ^
	/q ^
	/t:c:\temp\

.\dotnetfx.35.redist.full.exe ^
	/q ^
	/t:c:\temp\

.\dotnetfx.35.sp1.redist.full.exe ^
	/q ^
	/t:c:\temp\


pause
exit



.\dotnetfx.11.redist.exe ^
  /q REBOOT=ReallySupress

.\dotnetfx.11.sp1.full.NDP1.1sp1-KB867460-X86.exe ^
  /q /norestart REBOOT=ReallySupress

.\dotnetfx.20.redist.exe ^
  /q /norestart REBOOT=ReallySupress

.\dotnetfx.20.SP1_x86.exe ^
  /q /norestart REBOOT=ReallySupress

.\dotnetfx.30.redist.full.exe ^
  /q /norestart REBOOT=ReallySupress

.\dotnetfx.35.redist.full.exe ^
  /q /norestart REBOOT=ReallySupress

.\dotnetfx.35.sp1.redist.full.exe ^
  /q /norestart REBOOT=ReallySupress


pause