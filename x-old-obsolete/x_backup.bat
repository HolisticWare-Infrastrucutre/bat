SET source=c:
SET destination=\\10.0.0.2\exchange\mc\

set DIR=bin
robocopy ^
	"%source%\%DIR%" ^
	"%destination%\%DIR%" ^
	/MIR /R:1 /w:3


set DIR=bat
robocopy ^
	"%source%\%DIR%" ^
	"%destination%\%DIR%" ^
	/MIR /R:1 /w:3

net stop SQLSERVERAGENT
net stop "SQL Server (MSSQLSERVER)"
net stop MSSQLSERVER


set DIR=Program Files\Microsoft SQL Server\MSSQL\Data
robocopy ^
	"%source%\%DIR%" ^
	"%destination%\%DIR%" ^
	/XF master* mastlog* model* msdb* temp* ^
	/MIR /R:1 /w:3

set DIR=Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data
robocopy ^
	"%source%\%DIR%" ^
	"%destination%\%DIR%" ^
	/XF master* mastlog* model* msdb* temp* ^
	/MIR /R:1 /w:3

set DIR=Documents and Settings\miljenko.cvjetko.ES_RIZ_BIZ
robocopy ^
	"%source%\%DIR%" ^
	"%destination%\%DIR%" ^
	/XF NTuser* UsrClass* PerfLib*^
	/MIR /R:1 /w:3


set DIR=Program Files\eMule
robocopy ^
	"%source%\%DIR%" ^
	"%destination%\%DIR%" ^
	/MIR /R:1 /w:3


pause