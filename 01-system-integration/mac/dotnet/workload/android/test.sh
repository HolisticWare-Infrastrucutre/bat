#!/bin/zsh

    echo \
    "
    ---------------------------------------------------------------------------
    export JAVA_HOME=$JAVA_HOME_MICROSOFT_17
    $ANDROID_SDK_ROOT/cmdline-tools/19.0/bin/sdkmanager \
        --install \
            "platform-tools"
    "
    export JAVA_HOME=$JAVA_HOME_MICROSOFT_17
    $ANDROID_SDK_ROOT/cmdline-tools/19.0/bin/sdkmanager \
        --install \
            "platform-tools"

    echo \
    "
    ---------------------------------------------------------------------------
    rm -fr \\
        $HOME/Downloads/dotnet/samples/AppAndroid/

    dotnet new \\
        android \\
            --output $HOME/Downloads/dotnet/samples/AppAndroid/

    "
    rm -fr \
        $HOME/Downloads/dotnet/samples/AppAndroid/

    dotnet new \
        android \
            --output $HOME/Downloads/dotnet/samples/AppAndroid/

    echo \
    "
    ---------------------------------------------------------------------------
    dotnet \\
        build \\
        $HOME/Downloads/dotnet/samples/AppAndroid/ \\
            -v:diagnostic \\
            -t:InstallAndroidDependencies \\
            -p:AcceptAndroidSdkLicenses=true \\
            -p:AndroidManifestType=GoogleV2 \\
            -p:AndroidSdkDirectory=$ANDROID_SDK_ROOT \\
            -bl:$HOME/Downloads/dotnet/samples/AppAndroid/install-android-dependencies-GoogleV2.binlog

    "
    dotnet \
        build \
        $HOME/Downloads/dotnet/samples/AppAndroid/ \
            -v:diagnostic \
            -t:InstallAndroidDependencies \
            -p:AcceptAndroidSdkLicenses=true \
            -p:AndroidManifestType=GoogleV2 \
            -p:AndroidSdkDirectory=$ANDROID_SDK_ROOT \
            -bl:$HOME/Downloads/AppAndroid/install-android-dependencies-GoogleV2.binlog

    echo \
    "
    ---------------------------------------------------------------------------
    dotnet \\
        run \\
        --project \\
            $HOME/Downloads/dotnet/samples/AppAndroid/ \
    "
    dotnet \
        run \
        --project \
            $HOME/Downloads/AppAndroid/ \
