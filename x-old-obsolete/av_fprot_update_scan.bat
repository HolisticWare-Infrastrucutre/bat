set HOME=D:\doc\tools.security\11_scanning_testing\04_malware\av\f-prot\f-prot
set WGETRC=


:: DOWNLOAD update wget

del fp-def.zip.*
del macrdef2.zip.*

c:\bin\wget --passive-ftp ^
	ftp://ftp.fu-berlin.de/pc/msdos/virus/f-prot/updates/f-prot/fp-def.zip
c:\bin\wget --passive-ftp ^
	ftp://ftp.fu-berlin.de/pc/msdos/virus/f-prot/updates/f-prot/dos/macrdef2.zip

::c:\bin\wget --pasive-ftp ftp://ftp.f-prot.com/pub/fp-def.zip
::c:\bin\wget ftp://ftp.f-prot.com/pub/macrdef2.zip



::---------------------------------------------------------------------
:: DOWNLOAD update ftp 

::ftp -s:av_fprot_update.ftp

c:\bin\unzip -o fp-def.zip -d\bin\
c:\bin\unzip -o macrdef2.zip -d\bin\

::pause


c:\bin\f-prot.exe ^
	/nofloppy /ARCHIVE=y /AUTO /beep ^
	/COLLECT /HARD /LIST /NOHEUR /PACKED ^
	/REPORT=report.log

pause

set HOME=
set WGETRC=
