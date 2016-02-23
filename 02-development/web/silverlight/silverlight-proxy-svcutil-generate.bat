@exco off


set WSDL=

"C:\Program Files (x86)\Microsoft SDKs\Silverlight\v4.0\Tools\SlSvcUtil.exe" ^
    /directory:SL4 ^
    %WSDL%

"C:\Program Files (x86)\Microsoft SDKs\Silverlight\v5.0\Tools\SlSvcUtil.exe" ^
    /directory:SL5 ^
    %WSDL%

pause
