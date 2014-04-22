:: preconfiguration
:: 1. netfw.inf
:: 	used by restore defaults
::	preferred method for custom installations
::	all global options
:: 2. unattend.txt
::	all global options
:: 3. winbon.ini / sysprep
::	all global options

:: command prompt
netsh firewall show config

:: group policy
:: enterprise settings recommended
:: 01. protect all network connections
:: 02. do not allow exceptions
:: 03. define program exceptions
:: 04. allow local program exceptions
:: 05. allow remote admin exception
:: 06. allow file and print sharing exception
:: 07. allow ICMP exception
:: 08. allow Remote Desktop exception
:: 09. allow UPnP framework exception
:: 10. prohibit notifications
:: 11. allow logging
:: 12. define port exceptions
:: 13. allow localport exceptions
:: 
:: 3rd party
:: disable for accidental installation
:: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\EnableFirewall=0
::
::
:: Answer files unattend.txt and sysprep.ini
:: NEW sections!
:: [IEHardening]
::	LocalIntranetSites = http://internal_1;http://internal_2 
::	TrustedSites = http://microsoft.com;http://fabrikam.com 
:: [IEPopupBlocker]
:: AllowedSites=www.msfn.org;www.microsoft.com;www.amazon.com
:: 	BlockPopups=Yes 
:: 	FilterLevel=Medium 
:: 	ShowInformationBar=Yes 
:: [WindowsFirewall] 

pause
