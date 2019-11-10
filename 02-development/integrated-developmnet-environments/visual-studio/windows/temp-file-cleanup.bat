@echo off

:: http://weblogs.asp.net/psheriff/archive/2011/11/08/clean-up-after-visual-studio.aspx

echo ==========================================================================================
explorer /n /e /root,^
	"%WINDIR%\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\" 
explorer /n /e /root,^
	"%WINDIR%\Microsoft.NET\Framework\v3.5\Temporary ASP.NET Files\" 
explorer /n /e /root,^
	"%WINDIR%\Microsoft.NET\Framework\v3.0\Temporary ASP.NET Files\" 
explorer /n /e /root,^
	"%WINDIR%\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\" 
explorer /n /e /root,^
	"%WINDIR%\Microsoft.NET\Framework\v1.1.4322\Temporary ASP.NET Files\" 
explorer /n /e /root,^
	"%WINDIR%\Microsoft.NET\Framework\v1.0.3705\Temporary ASP.NET Files\" 
echo ==========================================================================================

explorer /n /e /root,^
	"%USERPROFILE%\AppData\Local\Microsoft\WebsiteCache"
explorer /n /e /root,^
	"%USERPROFILE%\AppData\Local\Temp\Temporary ASP.NET Files\"

	
@IF %ERRORLEVEL% NEQ 0 PAUSE
