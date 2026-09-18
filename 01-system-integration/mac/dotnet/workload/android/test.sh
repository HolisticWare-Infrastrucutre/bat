#!/bin/zsh

export FOLDER=$HOME/Downloads/HolisticWare

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
        $FOLDER/dotnet/samples/AppAndroid/

    dotnet new \\
        android \\
            --output $FOLDER/dotnet/samples/AppAndroid/

    "
    rm -fr \
        $FOLDER/dotnet/samples/AppAndroid/

    dotnet new \
        android \
            --output $FOLDER/dotnet/samples/AppAndroid/

    echo \
    "
    ---------------------------------------------------------------------------
    dotnet \\
        build \\
        $FOLDER/dotnet/samples/AppAndroid/ \\
            -v:diagnostic \\
            -t:InstallAndroidDependencies \\
            -p:AcceptAndroidSdkLicenses=true \\
            -p:AndroidManifestType=GoogleV2 \\
            -p:AndroidSdkDirectory=$ANDROID_SDK_ROOT \\
            -bl:$FOLDER/dotnet/samples/AppAndroid/install-android-dependencies-GoogleV2.binlog

    "
    dotnet \
        build \
        $FOLDER/dotnet/samples/AppAndroid/ \
            -v:diagnostic \
            -t:InstallAndroidDependencies \
            -p:AcceptAndroidSdkLicenses=true \
            -p:AndroidManifestType=GoogleV2 \
            -p:AndroidSdkDirectory=$ANDROID_SDK_ROOT \
            -bl:$FOLDER/AppAndroid/install-android-dependencies-GoogleV2.binlog

    echo \
    "
    ---------------------------------------------------------------------------
    dotnet \\
        run \\
        --project \\
            $FOLDER/dotnet/samples/AppAndroid/ \
    "
    dotnet \
        run \
        --project \
            $FOLDER/AppAndroid/ \
