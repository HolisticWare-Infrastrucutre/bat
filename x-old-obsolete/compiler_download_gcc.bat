rem SET http_proxy="http://proxy.hl.siemens.de:81"
rem SET ftp_proxy="http://proxy.hl.siemens.de:80"
rem SET gopher_proxy="http://proxy.hl.siemens.de:80"
SET HTTP_PROXY=http://proxy.hl.siemens.de:80
SET FTP_PROXY=http://proxy.hl.siemens.de:81
SET GOPHER_PROXY=http://proxy.hl.siemens.de:81

e:\bin\wget.exe 						^
	--recursive 						^
	--no-parent 						^
	--continue						^
	--convert-links						^
	--proxy=on 						^
	--accept=tar.gz						^
	ftp://gd.tuwien.ac.at/gnu/gcc/releases/gcc-3.0.3/


exit 0


	http://ftp.inf.tu-dresden.de/software/windows/cygwin32/
	ftp://ftp.freesoftware.com/pub/sourceware/	
	ftp://gd.tuwien.ac.at/gnu/cygwin/
