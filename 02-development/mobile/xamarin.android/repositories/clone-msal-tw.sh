#!/bin/bash




# clone repo branch to folder

export FOLDER=msal-tw-01
export BRANCH=trwalke/AndroidBinding

git clone \
    --branch $BRANCH \
    https://github.com/xamarin/xamarin-android.git \
    $FOLDER

export FOLDER=msal-sample
export BRANCH=master

export FOLDER=msal-sample
export BRANCH=master

git clone \
    --branch $BRANCH \
    https://github.com/AzureAD/microsoft-authentication-library-for-dotnet.git \
    $FOLDER

