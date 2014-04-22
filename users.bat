ECHO.
ECHO Deleting ASP.NET User Account created by .NET Framework 1.1...
net user aspnet /delete

ECHO.
ECHO Deactivating Guest Account
net user Guest /active:no

