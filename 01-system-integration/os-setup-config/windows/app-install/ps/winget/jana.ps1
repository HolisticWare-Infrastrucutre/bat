# Jana

$progressPreference = 'silentlyContinue'
Write-Host "Installing WinGet PowerShell module from PSGallery..."
Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
Write-Host "Using Repair-WinGetPackageManager cmdlet to bootstrap WinGet..."
Repair-WinGetPackageManager -AllUsers
Write-Host "Done."

wsl --install
wsl --install -d Debian


sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install build-essential gdb
whereis g++
whereis gdb

sudo apt autoremove -y
sudo apt upgrade
sudo apt install build-essential



sudo apt-get install gcc g++ gdb -y
gcc --version



winget install --id Microsoft.WindowsTerminal -e



winget install --interactive MSYS2.MSYS2
pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain

gcc --version
g++ --version

winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.VisualStudioCode.Insiders
winget install -e --id VSCodium.VSCodium
winget install -e --id VSCodium.VSCodium.Insiders
winget install -e --id zokugun.MrCode
winget install -e --id=ZedIndustries.Zed

winget install -e --id Git.Git
winget install -e --id git.git
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

winget install -e --id cmake 
winget install -e --id ninja-build.ninja

inget install Microsoft.DotNet.SDK.9
winget install Microsoft.DotNet.SDK.10

winget install -e --id GLab.GLab
winget install -e --id Gitlab.Runner

winget install -e --id=MartinStorsjo.LLVM-MinGW.MSVCRT
winget install -e --id=LLVM.LLVM
winget install -e --id=Python.Python.3.14
winget install -e --id=Julialang.Juliaup

winget install -e --id=VideoLAN.VLC.Nightly
winget install -e --id DonationCoder.ScreenshotCaptor
winget install -e --id icsharpcode.ILSpy

winget install -e --id Cygwin.Cygwin
winget install -e --id Orwell.Dev-C++

winget install -e --id Python.Python.3.11
winget install -e --id Microsoft.VisualStudio.2022.Community
winget install -e --id JetBrains.Rider.EAP
winget install -e --id dnSpyEx.dnSpy

# VHDL
winget install -e --id ghdl.ghdl.ucrt64.mcode
winget install -e --id NickGasson.NVC

winget install -e --id Mozilla.Thunderbird
winget install -e --id=SlackTechnologies.Slack
winget install -e --id WhatsApp.WhatsApp
winget install -e --id=Microsoft.Teams
winget install -e --id=Discord.Discord
winget install -e --id=Telegram.TelegramDesktop
winget install -e --id=OpenWhisperSystems.Signal

winget install -e --id VideoLAN.VLC.Nightly

winget install -e --id Docker.DockerDesktop
winget install -e --id Kubernetes.kompose

winget install -e --id SomePythonThings.WingetUIStore
winget install -e --id Chocolatey.ChocolateyGUI

winget install -e --id 7zip.7zip

winget install -e --id zumoshi.BrowserSelect

winget install -e --id Microsoft.VisualStudio.Professional.Insiders
winget install -e --id Microsoft.VisualStudio.Community.Insiders


winget install -e --id Ollama.Ollama
winget install -e --id ggml.llamacpp
winget install -e --id ElementLabs.LMStudio
winget install -e --id Anthropic.ClaudeCode
winget install -e --id Alibaba.Qwen
winget install -e --id WindSurfAI.WindSurf

winget install -e --id Docker.DockerDesktop
winget install -e --id Docker.DockerCompose
winget install -e --id JesseDuffield.Lazydocker

winget install -e --id Google.Chrome
winget install -e --id=Google.Chrome.Dev
winget install -e --id Microsoft.Edge.Canary
winget install -e --id Microsoft.Edge.Beta
winget install -e --id Mozilla.Firefox
winget install -e --id=Mozilla.Firefox.MSIX.Nightly
winget install -e --id Opera.Opera
winget install -e --id TorProject.TorBrowser
winget install -e --id=Brave.Brave.Nightly
winget install -e --id zumoshi.BrowserSelect

winget install -e --id JanDeDobbeleer.OhMyPosh

winget install -e --id Microsoft.WindowsTerminal


# Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol `
            = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install ollama
choco install lmstudio
choco install claude
choco install windsurf
