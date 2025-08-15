#!/bin/zsh

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $HOME/Downloads/AppAndroid/

    dotnet new \\
        android \\
            --output $HOME/Downloads/AppAndroid/

    "
    rm -fr \
        $HOME/Downloads/AppAndroid/

    dotnet new \
        android \
            --output $HOME/Downloads/AppAndroid/

    echo \
    "
    dotnet \\
        build \\
        $HOME/Downloads/AppAndroid/ \\
            -v:diagnostic \\
            -t:InstallAndroidDependencies \\
            -p:AcceptAndroidSdkLicenses=true \\
            -p:AndroidManifestType=GoogleV2 \\
            -p:AndroidSdkDirectory=$ANDROID_SDK_ROOT \\
            -bl:$HOME/Downloads/AppAndroid/install-android-dependencies-GoogleV2.binlog

    "
    dotnet \
        build \
        $HOME/Downloads/AppAndroid/ \
            -v:diagnostic \
            -t:InstallAndroidDependencies \
            -p:AcceptAndroidSdkLicenses=true \
            -p:AndroidManifestType=GoogleV2 \
            -p:AndroidSdkDirectory=$ANDROID_SDK_ROOT \
            -bl:$HOME/Downloads/AppAndroid/install-android-dependencies-GoogleV2.binlog


    dotnet \
        run \
        --project \
            $HOME/Downloads/AppAndroid/ \



    dotnet new \
        uninstall \
            Microsoft.macOS.Templates
    dotnet new \
        install \
            Microsoft.macOS.Templates

    dotnet new \
        macos \
            --output \
                $HOME/Downloads/AppMacOS/

    dotnet \
        run \
        --project \
                $HOME/Downloads/AppMacOS/

    dotnet new \
        ios \
            --output \
                $HOME/Downloads/AppiOS/

    dotnet \
        run \
        --project \
                $HOME/Downloads/AppiOS/
