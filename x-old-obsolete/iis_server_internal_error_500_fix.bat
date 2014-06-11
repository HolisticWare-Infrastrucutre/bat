@echo off

Echo Stop IIS 

iisreset /stop 
echo "----------------------" 

echo "Deleting the ASPNET account." 
net user ASPNET /delete 
echo "----------------------" 

echo "Reregistering ASP.NET and the ASPNET account." 
aspnet_regiis -i 

echo "Restarting IIS." 
iisreset /start 
echo "----------------------" 

pause

:: 1) Make sure the "Distributed Transaction Coordinator" service is running (!) 
:: 2) reinstall ISS 
:: 3) run "aspnet_regiis.exe -i" 
:: 4) run "regsvr32 aspnet_isapi.dll" 
