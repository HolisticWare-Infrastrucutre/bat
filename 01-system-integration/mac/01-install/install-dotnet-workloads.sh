#!/bin/zsh

dotnet workload search android
dotnet workload search ios     
dotnet workload search macos
dotnet workload search mac
dotnet workload search tvos
dotnet workload search maui


sudo dotnet workload install \
    android \
    android-aot \

sudo dotnet workload install \
    ios \

sudo dotnet workload install \
    macos \
    maccatalyst \


sudo dotnet workload install \
    tvos \

sudo dotnet workload install \
    maui \
    maui-android \
    maui-desktop \
    maui-ios \
    maui-maccatalyst \
    maui-mobile \
    maui-windows \