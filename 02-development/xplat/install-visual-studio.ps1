$data = 
@(
    #==================================================================================================================================
    # https://docs.microsoft.com/en-us/visualstudio/install/create-an-offline-installation-of-visual-studio?view=vs-2022
    [pscustomobject]
    @{
        url='https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&cid=2030&passive=false';
        file='VisualStudioForWindowsInstaller.Community.exe'
    },
    [pscustomobject]
    @{
        url='https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Enterprise&channel=Release&version=VS2022&source=VSLandingPage&cid=2030&passive=false';
        file='VisualStudioForWindowsInstaller.Enterprise.exe'
    },
    #==================================================================================================================================

    #==================================================================================================================================
    [pscustomobject]
    @{
        url='https://aka.ms/vs/mac/download';
        file='VisualStudioForMacInstaller.dmg'
    },
    #==================================================================================================================================


    #==================================================================================================================================
    #     https://code.visualstudio.com/download#
    [pscustomobject]
    @{
        #url='https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user';
        url='https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user';
        file='VSCodeUserSetup-x64.exe'
    },
    [pscustomobject]
    @{
        #url='https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal';
        url='https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal';
        file='VSCode-darwin-universal.zip';
    }
    #==================================================================================================================================

)

# https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-arrays?view=powershell-7.2
# $PSItem it is the same thing as $_
$data | ForEach-Object {
    "Item: [$PSItem.url]"
}    

"#######################################################################################################################"
foreach ( $node in $data )
{
    "Item: [$node]"
    Invoke-WebRequest -Uri $node.url -OutFile $node.file
}

# $WebClient = New-Object System.Net.WebClient
# $WebClient.DownloadFile
#                 (
#                     "https://www.contoso.com/file", 
#                     ".\"
#                 )
# 
#                 Invoke-WebRequest -Uri "http://www.contoso.com" -OutFile "C:\path\file"