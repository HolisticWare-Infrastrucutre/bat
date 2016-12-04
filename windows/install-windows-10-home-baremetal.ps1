Set-ExecutionPolicy RemoteSigned

iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco install -y `
    jre8 `
    jdk8 `
    android-sdk `
    androidstudio `

android list sdk --all --extended 
android update sdk --no-ui


    visualstudio2015community `
    visualstudiocode `

choco install -y `
    ccleaner `
    git `
    tortoisegit `


choco install -y `
    xamarin `


choco install -y `
    xamarin-visualstudio -version 4.2.0.695 `
    xamarin-studio -version 6.1.1.15 `
    xamarin-android-player-64b -version 0.6.5 `

choco install -y `
    kb2919355 `
    kb2919442 `
