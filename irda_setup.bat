exit

%SystemDrive%
cd %SystemRoot%\inf
mkdir \backup

pause

xcopy *irda*.* \backup
del *irda*.*
xcopy msports.inf \backup 

xcopy d:\sw\ms\irda\msports.inf .\