
<# 
install-windows-subsystem-for-linux.ps1

Run as Administrator / Elevate
#>

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

wsl --list --verbose
wsl -l -v