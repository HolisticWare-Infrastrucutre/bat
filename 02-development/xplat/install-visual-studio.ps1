$data = 
@(
    https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user
    https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal
    https://code.visualstudio.com/download#
    
    #==================================================================================================================================
    [pscustomobject]
    @{
        url='https://aka.ms/vs/mac/download';
        file='VisualStudioForMacInstaller.dmg'
    },
    #----------------------------------------------------------------------------------------------------------------------------------
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-3.1.417-macos-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/95c7c3fe-7036-4724-8730-4631603d3b6b/8bc1f5d475ec827f5d8defe984a21a83/dotnet-sdk-3.1.417-osx-x64.pkg';
        file='sdk-3.1.417-macos-x64-installer.pkg'
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-3.1.23-macos-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/cb11b14e-09f4-48cf-9bc9-ed785ea2e3f3/f1b9d6ac94db6151422eb273520a05aa/dotnet-runtime-3.1.23-osx-x64.pkg';
        file='runtime-3.1.23-macos-x64-installer.pkg';
    }
    #==================================================================================================================================


    #==================================================================================================================================
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-5.0.406-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/f92c52da-2ef6-44f2-a296-487f94c2c37a/258dc2e61ff8bec7d90aee3ca1e7d8a3/dotnet-sdk-5.0.406-win-x64.exe';
        file='sdk-5.0.406-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-aspnetcore-5.0.15-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/69b4d158-fadb-46d0-8b28-6c4ba2968926/c4d93beeb194b73c134b3c2824499467/aspnetcore-runtime-5.0.15-win-x64.exe';
        file='runtime-aspnetcore-5.0.15-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-5.0.15-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/b1902c77-e022-4b3e-a01a-e8830df936ff/09d0957435bf8c37eae11b4962d4221b/windowsdesktop-runtime-5.0.15-win-x64.exe';
        file='runtime-desktop-5.0.15-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-5.0.15-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/744a5a4b-c931-4365-9762-5154e999af13/51553f5bfe24e1f7d54abbfbb94d0c4c/dotnet-runtime-5.0.15-win-x64.exe';
        file='runtime-5.0.15-windows-x64-installer.exe';
    },
    #----------------------------------------------------------------------------------------------------------------------------------
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-5.0.406-macos-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/045ed34f-4b45-4b3f-8eb4-030995b418f8/2447384cc7e66980d8a4cfb55f792e83/dotnet-sdk-5.0.406-osx-x64.pkg';
        file='sdk-5.0.406-macos-x64-installer.pkg';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-5.0.15-macos-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/aae7783c-c033-4308-ab45-7edf78d8945b/bef03269b50362c36a56a6f21693dd26/dotnet-runtime-5.0.15-osx-x64.pkg';
        file='runtime-5.0.15-macos-x64-installer.pkg';
    },
    #==================================================================================================================================

    #==================================================================================================================================
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.201-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/1eb43f77-61af-40b0-8a5a-6165724dca60/f12aac6d4a907b4d54f5d41317aae0f7/dotnet-sdk-6.0.201-win-x64.exe';
        file='sdk-6.0.201-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-aspnetcore-6.0.3-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/10857513-e4fe-41eb-bb13-7ea5c02dcb00/ca75a693efb0b3c5cebf173eb7f98242/aspnetcore-runtime-6.0.3-win-x64.exe';
        file='runtime-aspnetcore-6.0.3-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{    
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-6.0.3-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/7f3a766e-9516-4579-aaf2-2b150caa465c/d57665f880cdcce816b278a944092965/windowsdesktop-runtime-6.0.3-win-x64.exe';
        file='runtime-desktop-6.0.3-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-6.0.3-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/1ac0b57e-cf64-487f-aecf-d7df0111fd56/2484cbe1ffacceacaa41eab92a6de998/dotnet-runtime-6.0.3-win-x64.exe';
        file='runtime-6.0.3-windows-x64-installer.exe';
    },
    #----------------------------------------------------------------------------------------------------------------------------------
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.201-macos-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/a5e0f5da-6088-451c-a341-b751c0d418c7/9fe3a31273888fe23cbe71cac32fa35c/dotnet-sdk-6.0.201-osx-x64.pkg';
        file='sdk-6.0.201-macos-x64-installer.pkg';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-6.0.3-macos-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/2a70a8b8-e0e7-4ccc-940b-d73b375b0636/75422fdccd9e762cc0c3176424779181/dotnet-runtime-6.0.3-osx-x64.pkg';
        file='runtime-6.0.3-macos-x64-installer.pkg';
    },
    #==================================================================================================================================


    
    #==================================================================================================================================
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-7.0.100-preview.2-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/e904f60b-8b5a-46cc-a3c7-e37f87aa9aa2/ee9decc38b24f05e6edf8a63639653a1/dotnet-sdk-7.0.100-preview.2.22153.17-win-x64.exe';
        file='sdk-7.0.100-preview.2-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-aspnetcore-7.0.0-preview.2-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/c6752a69-2860-495b-a1b8-ebbba3f5be19/d645486202d9357b6374ab78c52dfeed/aspnetcore-runtime-7.0.0-preview.2.22153.2-win-x64.exe';
        file='runtime-aspnetcore-7.0.0-preview.2-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-7.0.0-preview.2-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/15596c40-e6d3-4133-b04b-81fc9fbd532d/0bdd610ade324b0e67924169eeabded4/windowsdesktop-runtime-7.0.0-preview.2.22153.5-win-x64.exe';
        file='runtime-desktop-7.0.0-preview.2-windows-x64-installer.exe';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-7.0.0-preview.2-windows-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/76bb18a3-0fda-4a0d-9d2d-ce83667a2668/9534db4f3b885ef2ccdaa16d37cb3133/dotnet-runtime-7.0.0-preview.2.22152.2-win-x64.exe';
        file='runtime-7.0.0-preview.2-windows-x64-installer.exe';
    },
    #----------------------------------------------------------------------------------------------------------------------------------
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-7.0.100-preview.2-macos-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/f6ec71c8-fc91-49f4-8409-f36e5b58902a/3d3ccb4dcaf0823d55ecd470854cb2c8/dotnet-sdk-7.0.100-preview.2.22153.17-osx-x64.pkg';
        file='sdk-7.0.100-preview.2-macos-x64-installer.pkg';
    },
    [pscustomobject]
    @{
        #url='https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-7.0.0-preview.2-macos-x64-installer';
        url='https://download.visualstudio.microsoft.com/download/pr/9660c828-fb78-4fd7-85bc-3ab4e3dbb179/3c25335ff279f4e06c054e715b36f175/dotnet-runtime-7.0.0-preview.2.22152.2-osx-x64.pkg';
        file='runtime-7.0.0-preview.2-macos-x64-installer.exe';
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