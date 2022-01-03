#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/hw-commercial"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

mkdir gh
mkdir gl

export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://gitlab.com/holisticware-bindings/UsbThermalPrinterSDK.OOCP.git"
export DIR="./gl/UsbThermalPrinterSDK.OOCP/"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/holisticware-bindings/OCPP.PrinterThermal.USB.git"
export DIR="./gl/OCPP.PrinterThermal.USB/"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/holisticware-bindings/OCPP.PrinterThermal.Bluetooth.git"
export DIR="./gl/OCPP.PrinterThermal.Bluetooth/"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR


# https://gitlab.com/holisticware-bindings-commercial/PixoMeter.git
# https://gitlab.com/holisticware-bindings-commercial/Xtras-Binaries-Minimal-PixoMeter.git
# https://gitlab.com/holisticware-bindings-commercial/Xtras-Binaries-Xtensive-PixoMeter.git
# https://gitlab.com/pixolus-demo-adlair/pixolus.git
# https://moljac@bitbucket.org/pixolus_mobendo/pixometer_sdk_xamarin.git
# 
# https://gitlab.com/Commercial.Trilix.CashDesk/Commercial.Trilix.CashDesk.git
# https://gitlab.com/Private.Commercial.Trilix.CashDesk/Commercial.Trilix.CashDesk.git
# https://gitlab.com/Commercial.Trilix.CashDesk/Commercial.Trilix.CashDesk.git
# https://gitlab.com/Commercial.Trilix.CashDesk/Commercial.Trilix.CashDesk.Artwork.git
# 
# https://moljac@bitbucket.org/drazenzg/ep_app.git
# https://moljac@bitbucket.org/luko_gjenero/uavsidekick.git
# https://github.com/jamesmontemagno/PagerSlidingTabStrip-for-Xamarin.Android.git





cd $DIR_ROOT