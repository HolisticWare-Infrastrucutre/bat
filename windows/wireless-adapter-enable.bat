
set PATH=%PATH%;C:\windows\system32\wbem\

call ".\wireless-adapter-info.bat"

set NIC="Intel(R) Wireless WiFi Link 4965AGN"
set NIC_IDX="7"

wmic.exe path win32_networkadapter where index=%NIC_IDX% call enable

set ADAPTER="Wireless Network Connection"
netsh interface set interface %ADAPTER% enable
netsh interface set interface %ADAPTER% admin=enable
