#!/bin/zsh

export FOLDER=$HOME/Downloads/HolisticWare

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    "
avdmanager list avd

avdmanager list avd --compact 2>&1 | head -n 1

dev_android_emulator_launch \
    $(avdmanager list avd --compact 2>&1 | head -n 1)



    rm -fr \
        $FOLDER/dotnet/samples/AppMAUI01/

    dotnet new \
        mauiapp \
            --output \
                $FOLDER/dotnet/samples/AppMAUI01/

    dotnet build \
        --target:run \
        --framework net10.0-android \
            $FOLDER/dotnet/samples/AppMAUI01/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $FOLDER/dotnet/samples/AppMAUI01/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $FOLDER/dotnet/samples/AppMAUI01/

    rm -fr \
        $FOLDER/dotnet/samples/AppMAUI02/
        
    dotnet new \
        maui \
            --output \
                $FOLDER/dotnet/samples/AppMAUI02/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $FOLDER/dotnet/samples/AppMAUI02/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $FOLDER/dotnet/samples/AppMAUI02/


    rm -fr \
        $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet new \
        maui-blazor-web \
            --output \
                $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/
 
 
 
    rm -fr \
        $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.Blazor/
 
    dotnet new \
        maui-blazor \
            --output \
                $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.Blazor/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.Blazor/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.Blazor/AppMAUI.MobileHybrid.BlazorWeb/



    rm -fr \
        $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/

    dotnet \
        new \
            fluentmaui-blazor-web \
                --framework net10.0 \
                --output \
                    $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/


    dotnet build \
        --framework net10.0-ios \
            $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/AppMAUI.MobileHybrid.BlazorFluentWeb/

    dotnet build \
        --target:run \
        --framework net10.0-ios \
            $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/AppMAUI.MobileHybrid.BlazorFluentWeb/
 
    dotnet run \
        --framework net10.0-maccatalyst \
        --project \
             $FOLDER/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/AppMAUI.MobileHybrid.BlazorFluentWeb/


    dotnet \
        new \
            maui-multiproject \
                --output \
                    $FOLDER/dotnet/samples/maui-multiproject/AppMAUI.MultiProject/


    dotnet \
        new \
            maui-multihead \
                --output \
                    $FOLDER/dotnet/samples/maui-multiproject/AppMAUI.MultiHead/
