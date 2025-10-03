# Jana

winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.VisualStudioCode.Insiders
winget install -e --id VSCodium.VSCodium
winget install -e --id VSCodium.VSCodium.Insiders
winget install -e --id zokugun.MrCode


winget install -e --id Git.Git
winget install -e --id StephanDilly.gitui
winget install -e --id TortoiseGit.TortoiseGit
winget install -e --id Microsoft.GitCredentialManagerCore
winget install -e --id Gitlab.Runner
winget install -e --id GitHub.GitLFS
winget install -e --id GitHub.GitHubDesktop
winget install -e --id GitHub.GitHubDesktop.Beta
winget install -e --id Microsoft.Git
winget install -e --id GitHub.cli
winget install -e --id nektos.act

winget install -e --id GLab.GLab
winget install -e --id Gitlab.Runner

winget install -e --id DonationCoder.ScreenshotCaptor
winget install -e --id icsharpcode.ILSpy

winget install -e --id Cygwin.Cygwin
winget install -e --id Orwell.Dev-C++

winget install -e --id Python.Python.3.11
winget install -e --id Microsoft.VisualStudio.2022.Community
winget install -e --id JetBrains.Rider.EAP
winget install -e --id dnSpyEx.dnSpy

winget install -e --id Mozilla.Thunderbird

winget install -e --id Docker.DockerDesktop
winget install -e --id Kubernetes.kompose

winget install -e --id SomePythonThings.WingetUIStore
winget install -e --id Chocolatey.ChocolateyGUI

winget install -e --id 7zip.7zip

winget install -e --id zumoshi.BrowserSelect


Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol `
            = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install ollama
choco install lmstudio
choco install claude
choco install windsurf
