#!/bin/zsh

source $HOME/bat/01-system-integration/mac/01-uninstall-clean-remove-nuke/nuget.sh

export WORKLOADZ=\
"\
"
#            maui-tizen \

sudo \
    dotnet \
        workload \
            uninstall \
                android \
                ios \
                maccatalyst \
                tvos \
                macos \
                maui \
                maui \
                maui-android \
                maui-ios \
                maui-maccatalyst \
                maui-mobile \
                maui-windows \
                tvos \
                wasm-tools \


sudo \
    dotnet \
        workload \
            install \
                android \
                ios \
                maccatalyst \
                tvos \
                macos \
                maui \
                maui \
                maui-android \
                maui-ios \
                maui-maccatalyst \
                maui-mobile \
                maui-windows \
                tvos \
                wasm-tools \

exit 0


            –sdk-version 7.0.202 \
            –no-cache \
            –disable-parallel \
            
            –source “https://api.nuget.org/v3/index.json” \
            -source "https://aka.ms/dotnet6/nuget/index.json" \
            -source "https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet6/nuget/v3/index.json" \
            -source "https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet7/nuget/v3/index.json" \
            –source “https://pkgs.dev.azure.com/azure-public/vside/_packaging/xamarin-impl/nuget/v3/index.json” \



    dotnet workload \
        install \
            android \
            ios \
            maccatalyst \
            macos \
            maui \
            maui-android \
            maui-ios \
            maui-maccatalyst \
            maui-mobile \
            maui-windows \
            tvos \
            wasm-tools \
                --source https://pkgs.dev.azure.com/dnceng/public/_packaging/darc-pub-dotnet-runtime-dea52219/nuget/v3/index.json \
                --source https://aka.ms/dotnet6/nuget/index.json \
                --source https://api.nuget.org/v3/index.json

sudo \
    dotnet workload \
        uninstall \
            android \
            ios \
            maccatalyst \
            macos \
            maui \
            maui-android \
            maui-ios \
            maui-maccatalyst \
            maui-mobile \
            maui-windows \
            tvos \
            wasm-tools \
                --from-rollback-file https://aka.ms/dotnet/maui/main.json \
                --source https://aka.ms/dotnet6/nuget/index.json \
                --source https://aka.ms/dotnet/maui/main.json \
                --source https://api.nuget.org/v3/index.json

sudo \
    dotnet workload \
        install \
            android \
            ios \
            maccatalyst \
            macos \
            maui \
            maui-android \
            maui-ios \
            maui-maccatalyst \
            maui-mobile \
            maui-windows \
            tvos \
            wasm-tools \
                --source https://pkgs.dev.azure.com/dnceng/public/_packaging/darc-pub-dotnet-runtime-dea52219/nuget/v3/index.json \
                --source https://aka.ms/dotnet6/nuget/index.json \
                --source https://api.nuget.org/v3/index.json \




sudo dotnet workload \
    install \
        maui \
        maui-android \
        maui-ios \
        maui-maccatalyst \
        maui-desktop \
        maui-mobile \
        maui-windows \
        maui-tizen \
        wasm-tools-net6 \

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
