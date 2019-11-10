

#these scripts download a remote PowerShell script and execute it on your machine.

#Cmd.exe - 
@powershell `
    -NoProfile `
    -ExecutionPolicy Bypass `
    -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

# PowerShell.exe (Ensure Get-ExecutionPolicy is at least RemoteSigned) 
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# PowerShell v3+ (Ensure Get-ExecutionPolicy is at least RemoteSigned) - 
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# The easiest option to remember is this one. You may not need -UseBasicParsing.

# iwr (Invoke-WebRequest)/WebClient.DownloadString 
# downloads the install script and passes it to 
# iex (Invoke-Expression) 
# to execute the contents of the script. This runs the installation script for Chocolatey.
