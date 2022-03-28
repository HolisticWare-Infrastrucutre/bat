#!/bin/zsh

dotnet workload search android
dotnet workload search ios     
dotnet workload search macos
dotnet workload search mac
dotnet workload search tvos
dotnet workload search maui




    dotnet workload install `
        android `
        android-aot `

    dotnet workload install `
        ios

    dotnet workload install `
        macos `
        maccatalyst `

    dotnet workload install `
        tvos `

    dotnet workload install `
        maui `
        maui-android `
        maui-desktop `
        maui-ios `
        maui-maccatalyst `
        maui-mobile `
        maui-windows `


    dotnet workload install `
        microsoft-android-sdk-full `
        microsoft-ios-sdk-full `
        microsoft-maccatalyst-sdk-full `
        microsoft-macos-sdk-full `
        microsoft-tvos-sdk-full `
        maui `
