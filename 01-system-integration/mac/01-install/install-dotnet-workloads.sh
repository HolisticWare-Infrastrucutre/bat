#!/bin/zsh

# export ACTION=search
# export ACTION=uninstall
export ACTION=install
# export ACTION=update


dotnet workload search android
dotnet workload search ios     
dotnet workload search macos
dotnet workload search mac
dotnet workload search tvos
dotnet workload search maui



sudo \
    dotnet workload $ACTION \
        android \
        android-aot \

sudo \
    dotnet workload $ACTION \
        ios

sudo \
    dotnet workload $ACTION \
        macos \
        maccatalyst \

sudo \
    dotnet workload $ACTION \
        tvos \

sudo \
    dotnet workload $ACTION \
        maui \
        maui-android \
        maui-desktop \
        maui-ios \
        maui-maccatalyst \
        maui-mobile \
        maui-windows \


sudo \
    dotnet workload $ACTION \
        microsoft-android-sdk-full \
        microsoft-ios-sdk-full \
        microsoft-maccatalyst-sdk-full \
        microsoft-macos-sdk-full \
        microsoft-tvos-sdk-full \
        maui \

sudo dotnet workload update


sudo \
    dotnet workload uninstall \
        maui

sudo \
    dotnet workload install \
        maui