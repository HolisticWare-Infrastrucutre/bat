#!/bin/zsh

# https://github.com/dotnet/maui/blob/main/.github/DEVELOPMENT.md#net-maui-workload

# https://aka.ms/dotnet/6.0.2xx/daily/dotnet-sdk-osx-x64.pkg


dotnet nuget locals all --clear

dotnet tool list --global

# export ACTION=search
# export ACTION=uninstall
 export ACTION=install
#export ACTION=update


export WORKLOADZ=\
"
android
# android-aot
ios
# mac
macos
maccatalyst
maui
maui-android
maui-desktop
maui-ios
maui-maccatalyst
maui-mobile
maui-windows
microsoft-android-sdk-full
microsoft-ios-sdk-full
microsoft-maccatalyst-sdk-full
microsoft-macos-sdk-full
microsoft-tvos-sdk-full
tvos
wasm-tools
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for WORKLOAD in $WORKLOADZ
do
    if [[ $WORKLOAD == "#"* ]]
    then
        continue
    fi

    echo Tool: $WORKLOAD
    sudo \
        dotnet \
            workload \
                $ACTION \
                $WORKLOAD \
                --from-rollback-file https://aka.ms/dotnet/maui/main.json \
                --source https://aka.ms/dotnet6/nuget/index.json \
                --source https://api.nuget.org/v3/index.json

#    sudo \
#        dotnet workload install \
#            $WORKLOAD \

    sudo dotnet workload update

done

