:: I'm having winxp with SP2 as all of you have however, i havent installed
:: IIS yet, and everytime i try installing it, i get Setup cannot copy the
:: file staxmem.dll
:: ....insert "Windows XP Professional Service Pack 2 CD"...
:: 
:: called microsoft on this. They admited it was a bug. They sent me
:: this information:
:: 
:: Solution 1:
:: 
:: 
:: 
:: 1. Run "esentutl /g %windir%\security\database\secedit.sdb" to see if
:: the DB is 
:: 
:: corrupted.
:: 
:: 2. If so, follow KB 278316 
:: 
:: http://support.microsoft.com/default.aspx?scid=kb;en-us;2783 16 
:: 
:: 3. Reboot if necessary
:: 
:: 
:: 
:: Solution 2:
:: 
:: 
:: 
:: 1. Create an empty folder on your harddrive called something like
:: "c:\WinXp" 
:: 
:: (name doesn’t really matter. Just make sure it is empty).
:: 
:: 2. Copy the i386 folder off your original WinXP CD into your new empty
:: folder.
:: 
:: 3. Put your WinXPSP2 CD in your drive.
:: 
:: 4. Open a CMD prompt and change to the location of XPSP2.exe
:: 
:: 5. Type "xpsp2.exe /integrate:c:\WinXp"
:: 
:: 6. Attempt to install IIS again.
:: 
:: 7. When it prompts for files point it to "c:\WinXP"
:: 


esentutl /p %windir%\security\database\secedit.sdb


