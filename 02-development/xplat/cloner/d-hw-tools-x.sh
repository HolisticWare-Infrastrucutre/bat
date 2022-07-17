#!/bin/bash

# TODO: need cleanup/consolidation/merging
# https://github.com/HolisticWare-Xamarin-Tools
# https://github.com/holisticware-xamarin
# https://github.com/moljac/

export DIR_ROOT="/Users/Shared/Projects"

cd $DIR_ROOT
mkdir 

export DIR="$DIR_ROOT/d/hw-tools-x"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://gitlab.com/holisticware-tools-xamarin/holisticware.tools.ideas.git"
export DIR="0-ideas"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export BRANCH="main"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.DotNetNew.XamarinFormsProjectsStructureTemplate.SDKStyle.git"
export DIR="DotNetNew.XamarinFormsProjectsStructureTemplate.SDKStyle"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/holisticware-xamarin/HolisticWare.DotNetNew.XamarinProjectsStructureTemplate.git"
export DIR="DotNetNew.XamarinProjectsStructureTemplate"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export BRANCH="main"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.DotNetNew.XamarinAndroidMavenBindingsProjectsStructureTemplate"
export DIR="DotNetNew.XamarinAndroidMavenBindingsProjectsStructureTemplate"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export BRANCH="main"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.DotNetNew.CakeScriptDebugTemplate.git"
export DIR="DotNetNew.CakeScriptDebugTemplate"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export BRANCH="main"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.DotNetNew.ApplicationArchitectureStructureTemplate.git"
export DIR="DotNetNew.ApplicationArchitectureStructureTemplate"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR


export BRANCH="main"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.DotNetNew.MarkDownTopicTemplate.git"
export DIR="DotNetNew.MarkDownTopicTemplate"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR




export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.Xamarin.Tools.Bindings.XamarinAndroid.Intellisense.git"
export DIR="Intellisense"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.Xamarin.Tools.Bindings.XamarinAndroid.Decompilers.git"
export DIR="Decompilers"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.Xamarin.Tools.NuGet.JunkyAdictAnalyzer.git"
export DIR="JunkyAdictAnalyzer"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.Xamarin.Tools.Bindings.XamarinAndroid.MetadataXmlSpitter.git"
export DIR="MetadataXmlSpitter"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.Xamarin.Tools.MSBuildBinLogger.git"
export DIR="MSBuildBinLogger"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.Xamarin.Tools.Bindings.XamarinAndroid.JarInfoSpitter.git"
export DIR="JarInfoSpitter"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.Xamarin.Tools.Bindings.XamarinAndroid.FassBinderMeister.git"
export DIR="FassBinderMeister"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.Xamarin.Tools.Bindings.XamarinAndroid.AndroidX.Migraineator.git"
export DIR="AndroidX.Migraineator"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/HolisticWare-Xamarin-Tools/HolisticWare.Xamarin.Tools.Bindings.XamarinAndroid.SampleProjectKreator.git"
export DIR="SampleProjectKreator"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/moljac/Xamarin.Android.Samples.git"
export DIR="Xamarin.Android.Samples"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch $BRANCH \
        --recursive \
        $URL \
        $DIR


cd $DIR_ROOT