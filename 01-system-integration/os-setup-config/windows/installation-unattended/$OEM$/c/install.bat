".\drivers\PRO2KXP.exe"
".\drivers\PROEM64T.exe"

pause

".\drivers\elo\Windows XP Embedded USB\Setup.exe" /q
".\drivers\elo\EloWinXP Universal 4.40\EloSetup.exe" /q

pause

mkdir "c:\Program Files\RIZ\"
mkdir "c:\Program Files\RIZ\PPU\"

copy /Y /V .\PPU\*.* "c:\Program Files\RIZ\PPU\"

.\$OEM$\bat\autologon.reg
.\$OEM$\bat\startup.reg


mkdir c:\temp

set TEMP=c:\temp
set TMP=c:\temp


"c:\Program Files\RIZ\PPU\RIZ.TransmitterControl.SolidState.PPUStart.exe"

.\netfx\dotnetfx.11.redist.exe ^
	/t:c:\temp\

"c:\Program Files\RIZ\PPU\RIZ.TransmitterControl.SolidState.PPUStart.exe"

.\netfx\dotnetfx.11.sp1.full.NDP1.1sp1-KB867460-X86.exe ^
	/t:c:\temp\

"c:\Program Files\RIZ\PPU\RIZ.TransmitterControl.SolidState.PPUStart.exe"

.\netfx\dotnetfx.20.redist.exe ^
	/t:c:\temp\

"c:\Program Files\RIZ\PPU\RIZ.TransmitterControl.SolidState.PPUStart.exe"

.\netfx\dotnetfx.20.SP1_x86.exe ^
	/t:c:\temp\

"c:\Program Files\RIZ\PPU\RIZ.TransmitterControl.SolidState.PPUStart.exe"

.\netfx\dotnetfx.30.redist.full.exe ^
	/t:c:\temp\

"c:\Program Files\RIZ\PPU\RIZ.TransmitterControl.SolidState.PPUStart.exe"

.\netfx\dotnetfx.35.redist.full.exe ^
	/t:c:\temp\

"c:\Program Files\RIZ\PPU\RIZ.TransmitterControl.SolidState.PPUStart.exe"

.\netfx\dotnetfx.35.sp1.redist.full.exe ^
	/t:c:\temp\


pause
