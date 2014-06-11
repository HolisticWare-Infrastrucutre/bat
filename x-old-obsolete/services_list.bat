:: sample
:: wmic process list brief
:: wmic service list brief

echo off

::set SERVICES=^
::             servicename1 ^
::             servicename2

set SERVICES=^
             ALG ^
             wuauserv ^
             netsvcs ^
             CryptSvc ^
             DcomLaunch ^
             DHCP ^
             AudioSrv ^
             Browser ^
             dmserver ^
             Dnscache ^
             ERsvc ^
             EventSystem ^
             FastUserSwitchingCompatibility ^
             helpsvc ^
             LmHosts ^
             Messenger ^
             Nla ^
             PolicyAgent ^
             ProtectedStorage ^
             RemoteRegistry ^
             seclogon ^
             SamSS ^
             wscsvc ^
             shellHWDetection ^
             sharedaccess ^
             sens ^
             schedule ^
             Spooler ^
             srservice ^
             SSDPSRV ^
             TapiSrv ^
             TermService ^
             TrkWks ^
             uploadmgr ^
             W32Time ^
             WebClient ^
             WZCSVC             
             WmdmPmSp ^

echo off

::set SERVICES=^
::             servicename1 ^
::             servicename2

set SERVICES=^
             AudioSrv ^
             Browser ^
             CryptSvc ^
             dmserver ^
             Dnscache ^
             Ersvc ^
             EventSystem ^
             FastUserSwitchingCompatibility ^
             helpsvc ^
             LmHosts ^
             Messenger ^
             Netman ^
             Nla ^
             PolicyAgent ^
             ProtectedStorage ^
             RemoteRegistry ^
             Spooler ^
             srservice ^
             SSDPSRV ^
             TapiSrv ^
             TermService ^
             Themes ^
             TrkWks ^
             uploadmgr ^
             W32Time ^
             WebClient ^
             winmgmt ^
             WmdmPmSp ^
             WZCSVC
             


::-----------------------------------------------------------------------------------



for %%s IN (%SERVICES%) DO (
	echo %%s
        sc query displayname %%s
)


net stop msftpsvc
net stop w3svc
net stop mssqlserver


			 
::           Themes ^
::           Netman ^
::           winmgmt ^

