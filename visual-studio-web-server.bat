
:: (WebDev.WebServer) which used by Visual Studio to execute you web application when 
:: it’s running in the context of Visual Studio.  You can find the executable file 

WEBDEVSERVER20= "%PROGRAMFILES%\Common Files\microsoft shared\DevServer\10.0\WebDev.WebServer20.EXE" 
WEBDEVSERVER40= "%PROGRAMFILES%\Common Files\microsoft shared\DevServer\10.0\WebDev.WebServer40.EXE " 

WebDev.WebServer20 is targeted to CLR 2.0, all the ASP.NET Application which are 
targeted till FW .NET 3.5 will be taking care by WebDev.WebServer20.EXE and 
WebDev.WebServer40.EXE for ASP.NET 4.0 based application.

