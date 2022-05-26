# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$data = 
@(

    #==================================================================================================================================
    [pscustomobject]
    @{
        url='';
        file='';
    },
    #----------------------------------------------------------------------------------------------------------------------------------
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

    #==================================================================================================================================    
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/deb4711b-7bbc-4afa-8884-9f2b964797f2/fb603c451b2a6e0a2cb5372d33ed68b9/dotnet-sdk-6.0.300-win-x64.exe';
        file='dotnet-sdk-6.0.300-win-x64.exe';
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/042e2559-fe53-4793-b385-665b7c1ca6d5/308ffacc925383207a8f1a27a1df8bdc/aspnetcore-runtime-6.0.5-win-x64.exe';
        file='aspnetcore-runtime-6.0.5-win-x64.exe';
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/b395fa18-c53b-4f7f-bf91-6b2d3c43fedb/d83a318111da9e15f5ecebfd2d190e89/dotnet-runtime-6.0.5-win-x64.exe';
        file='dotnet-runtime-6.0.5-win-x64.exe';
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/c4de68d7-15fb-418a-ac11-fb51212cd16d/029648aa5eec8aed3800883620ec5d9e/dotnet-sdk-6.0.203-win-x64.exe';
        file='dotnet-sdk-6.0.203-win-x64.exe';
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/5681bdf9-0a48-45ac-b7bf-21b7b61657aa/bbdc43bc7bf0d15b97c1a98ae2e82ec0/windowsdesktop-runtime-6.0.5-win-x64.exe';
        file='windowsdesktop-runtime-6.0.5-win-x64.exe';
    },
    #----------------------------------------------------------------------------------------------------------------------------------
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
    #----------------------------------------------------------------------------------------------------------------------------------
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/0f71eaf1-ce85-480b-8e11-c3e2725b763a/9044bfd1c453e2215b6f9a0c224d20fe/dotnet-sdk-6.0.100-win-x64.exe';
        file='dotnet-sdk-6.0.100-win-x64.exe';
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/3223fa10-441d-406b-af2e-94874ce38199/09347f9b4aea0ab34d6944b6b78fa29d/aspnetcore-runtime-6.0.0-win-x64.exe';
        file='aspnetcore-runtime-6.0.0-win-x64.exe';
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/b9cfdb9e-d5cd-4024-b318-00390b729d2f/65690f2440f40654898020cdfffa1050/dotnet-runtime-6.0.0-win-x64.exe';
        file='dotnet-runtime-6.0.0-win-x64.exe';
    },    
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
        url='https://download.visualstudio.microsoft.com/download/pr/5c201d4c-7d2e-4814-89ec-6c5ef533c5ce/1882c3649dd6d55f2b9fc9e906408528/dotnet-sdk-3.1.419-win-x64.exe';
        file='dotnet-sdk-3.1.419-win-x64.exe'
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/7ab51957-c8c3-475b-97dc-40dfced11c46/0ad0962f5673110b780347496666af45/aspnetcore-runtime-3.1.25-win-x64.exe';
        file='aspnetcore-runtime-3.1.25-win-x64.exe'
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/b1c43147-5635-40e4-b5b2-49075772b8db/d1cc338cf20775e487a52879c103df2a/windowsdesktop-runtime-3.1.25-win-x64.exe';
        file='windowsdesktop-runtime-3.1.25-win-x64.exe'
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/53711efb-5204-408d-a12f-956141dc35f8/a60251c1d3660ef0aa4641f527385cff/dotnet-runtime-3.1.25-win-x64.exe';
        file='dotnet-runtime-3.1.25-win-x64.exe'
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/42778b69-3b6f-4542-a9ec-4eb5b1954dd6/eb2cb78b2827d75d6d2a7ab694a97298/dotnet-sdk-3.1.418-win-x64.exe';
        file='dotnet-sdk-3.1.418-win-x64.exe'
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/0a913779-e465-4dd6-a50d-be5cac4796dd/c9c134d00cab1f0b5e023ba7d21b679b/aspnetcore-runtime-3.1.24-win-x64.exe';
        file='aspnetcore-runtime-3.1.24-win-x64.exe'
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/c561eb57-4bf5-4bf4-aa3c-bd6dd0342c6a/5257304cf597d41ac6369c02813412c6/windowsdesktop-runtime-3.1.24-win-x64.exe';
        file='windowsdesktop-runtime-3.1.24-win-x64.exe'
    },
    [pscustomobject]
    @{
        url='https://download.visualstudio.microsoft.com/download/pr/2853878f-6a7b-472d-bd70-a6ef81babf55/16066a594cf3273d9cb004561e3fea5a/dotnet-runtime-3.1.24-win-x64.exe';
        file='dotnet-runtime-3.1.24-win-x64.exe'
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