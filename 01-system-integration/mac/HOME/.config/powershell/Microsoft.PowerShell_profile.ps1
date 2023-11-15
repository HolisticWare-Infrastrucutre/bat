Get-Alias   echo
gal         echo

<#
    Aliases
    https://learn.microsoft.com/en-us/powershell/scripting/learn/using-familiar-command-names?view=powershell-6
#>

Function sys_zsh_functions_list
{
    echo "--------------------------------------------------------------------------------------------------------------"
    echo `
    "
    Get-ChildItem function:\
    "
    Get-ChildItem function:\
}

Function sys_zshrc_reload
{
    echo "--------------------------------------------------------------------------------------------------------------"
    echo `
    "
    Reloading profile...
    & $profile
    "
    & $profile
}

Function Test-Elevated 
{
  $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
  $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
  $prp.IsInRole($adm)
}

function cal 
{ 
    bash -c cal
}


Function dev_dotnet_workloads_reinstall
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo `
  "
  . $HOME/bat/01-system-integration/mac/dotnet/workload/install.ps1
  "
  . $HOME/bat/01-system-integration/mac/dotnet/workload/install.ps1
}

Function dev_dotnet_workloads_clean
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo `
  "
  sudo dotnet workload clean
#  sudo dotnet workload clean --all
  "
  sudo dotnet workload clean
#  sudo dotnet workload clean --all
}
