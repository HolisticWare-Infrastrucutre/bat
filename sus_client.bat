reg ^
  query ^
  "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update"

reg ^
  query ^
  "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" ^
  /s

net stop wuauserv
:: change the AUState registry key from 5 (install) to 2 (detect)
net start wuauserv

wuauclt.exe /detectnow 


:: http://www.faqshop.com/sus/default.htm?http://www.faqshop.com/sus/general/basic%20trobshootting%20sus.htm
:: At the first place, you have to make sure the Automatic Update Polices, 
:: WUAU.ADM Template from Group Policy are applied, do a GPRESULT to see 
:: the applied GPO's.  Download GPRESULT to see the policies applied to 
:: that particular client.
:: 
GPRESULT



:: http://www.microsoft.com/windows2000/techi.../gpresult-o.asp
:: 
:: Also, use Group Policy Management Console to see the resultant policies
:: http://www.microsoft.com/downloads/details...&displaylang=en
::   
:: 2. If you are in WORKGROUP Environment, make sure you deploy the correct registry entries. See my post for configuring AU Clients via REGISTRY Entries for a Workgroup environment.
:: http://forums.susserver.com/index.php?act=ST&t=2460&f=3&view=findpost&p=9934
::   
:: Lets now confirm if the clients AU settings are applied.  To do so, run Reg query from Command Prompt, like:
:: Reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /s
::   
:: Once the settings are in place, let see some sort of permissions.  If you already had URLScanTool installed prior to installing SUS and it is set to block all *.exe files, SUS install doesn't change that URLScan setting, so the client computers will not be able to download any of the patches or updates. In order to correct this problem, you need to change urlscan.ini to allow *.exe requests, and then restarts Internet Information Services (IIS) or restart the SUS server.
:: http://forums.susserver.com/index.php?act=ST&t=2460&f=3&view=findpost&p=12750
:: 
:: Also, Check the following,C:\WINNT\system32\inetsrv\urlscan. Then you might want to change your "urlscan.ini". Have a look at  How To Install and Use the IIS Lockdown Wizard http://support.microsoft.com/default.aspx?...4&Product=iis50
:: 
:: Add the following setting in the urlscan.ini
:: [Allow Extensions]
:: .exe
:: And remove ".exe" it from...
:: [Deny Extensions]
:: --
:: [Allow Verbs]
:: GET
:: HEAD
:: POST
:: OPTIONS
:: For those interested, You can view an on-demand replay of the web cast on URL SCAN at
:: http://msevents.microsoft.com/CUI/WebCastE...3&Culture=en-US.
::   
:: In many cases, I have seen it’s always Library download error in windows update.log.  As part of Troubleshooting, you can try if you can download the file iuident.cab successfully from the workstation?? If not, go the next step;
:: 
:: http://YOUR-SUS-SERVER/iuident.cab
::   
:: Permissions play an important role in Automatic Updates with Software Update Services, so make sure you have effective IIS & NTFS permissions
:: 
:: Effective Permissions
:: Make sure on SUS SERVER 
:: You have ANONYMOUS ACCESS on Default Website
:: 
:: a) Default Web Site
:: b) \selfupdate
:: c) \autoupdate
:: d) \content
::   
:: C:\SUS\Content everyone should at least have READ Permission
::   
:: Web Anonymous User, IUSR & IWAM Users may have READ & EXECUTE, LIST FOLDER CONTENTS & READ Permission on C:\SUS\Content. 
:: f you have a Proxy Server within your network, Make sure,
:: (1) In your computer's Local Area Network (LAN) settings, the automatically detect settings check box is NOT selected 
:: (2) Bypass SUSSERVER from IE Tools-Internet Options-Connections-LAN settings-Advanced and add IP Address of your SUS Server.
:: (3) Run PROXYCFG from Command Prompt to see Bypass List (WinHttpSettings)
:: 
:: Somehow, AU client is dependent on the Proxy Bypass list, so let’s bypass that for good.
::   
:: Have a look at Event Viewer for any Errors & Warnings AND Have a look at client’s C:\windows\windows update.log
::   
:: Have a look at the AU State, AU STATE,
:: Reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" 
:: FYI, http://forums.susserver.com/index.php?act=ST&t=2460&f=3&view=findpost&p=9823
:: 
:: AU stores patches in C:\WUTEMP or C:\ProgramFiles\WindowsUpdate\wuaudnld.tmp while waiting to install the patches, Have a look at that
::   
:: You may Parse SUS IIS logs on http://pdxconsulting.com/sus for detailed client activity.
::   
:: Automatic Updates uses BITS to download the patches and BITS will try to resolve the SUS-SERVER-NAME in the first place, so you make sure you have a proper DNS HOST RECORD in your local DNS Server. If you are in Workgroup Environment, don’t worry, you can EDIT the workstations HOST FILE found at C:\WINDOWS\system32\drivers\etc\hosts to add IPADDRESS HOSTNAME, Where IP ADDRESS is your SUS SERVER IP with its HOSTNAME/NETBIOS NAME.
::   
:: Use the Bitsadmin tool (its on WinXP CD - Support Tools) to list the jobs & what they are reporting, Run Bitsadmin /list /allusers /verbose to see what is in the queue. This tool really helps in troubleshooting AU Clients.
::   
:: In the worst case, I would delete everything under C:\Program Files\WindowsUpdate\ AND C:\WUTEMP\ or C:\ProgramFiles\WindowsUpdate\wuaudnld.tmp\ while waiting to install the patches & then manually go to windowsupdate.com, and at least install any 1 of those missing patches and then use SUS later on, which will restore/recreate any corrupt files.
::   
:: I would suggest using IP ADDRESS as SUS SERVER NAME in SET OPTIONS on SUSADMIN instead of NetBIOS Name. I have seen many issues with BITS struggling to resolve NETBIOS NAME and in such case, this works like a treat. Also, while configuring AU Clients via GPO or REGEDITS, use the IP ADDRESS instead of NETBIOS NAME in WUServer & WUStatusServer.
::   
:: Make sure Windows Time is not skewed, Workstation Time should be in sync with the server.
::   
:: Post any queries/ errors on the SUS Forum for which I'm a Modertator and we'll try to help. 
:: FYI, 
:: AU uses PORT 80 to communicate with SUS SERVER.
:: Normally, it takes 17-22 hours for AU Client to Check SUSSERVER for updates.
:: 
