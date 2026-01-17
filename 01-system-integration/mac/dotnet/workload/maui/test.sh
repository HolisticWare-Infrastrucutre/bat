#!/bin/zsh

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    "
avdmanager list avd

avdmanager list avd --compact 2>&1 | head -n 1

dev_android_emulator_launch \
    $(avdmanager list avd --compact 2>&1 | head -n 1)



    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI01/

    dotnet new \
        mauiapp \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI01/

    dotnet build \
        --target:run \
        --framework net10.0-android \
            $HOME/Downloads/dotnet/samples/AppMAUI01/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI01/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $HOME/Downloads/dotnet/samples/AppMAUI01/

    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI02/
        
    dotnet new \
        maui \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI02/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI02/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $HOME/Downloads/dotnet/samples/AppMAUI02/


    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet new \
        maui-blazor-web \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/
 
 
 
    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.Blazor/
 
    dotnet new \
        maui-blazor \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.Blazor/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.Blazor/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.Blazor/AppMAUI.MobileHybrid.BlazorWeb/



    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/

    dotnet \
        new \
            fluentmaui-blazor-web \
                --framework net10.0 \
                --output \
                    $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/


    dotnet build \
        --framework net10.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/AppMAUI.MobileHybrid.BlazorFluentWeb/

    dotnet build \
        --target:run \
        --framework net10.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/AppMAUI.MobileHybrid.BlazorFluentWeb/
 
    dotnet run \
        --framework net10.0-maccatalyst \
        --project \
             $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/AppMAUI.MobileHybrid.BlazorFluentWeb/


    dotnet \
        new \
            maui-multiproject \
                --output \
                    $HOME/Downloads/dotnet/samples/maui-multiproject/AppMAUI.MultiProject/


    dotnet \
        new \
            maui-multihead \
                --output \
                    $HOME/Downloads/dotnet/samples/maui-multiproject/AppMAUI.MultiHead/
