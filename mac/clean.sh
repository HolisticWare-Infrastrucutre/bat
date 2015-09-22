#!/bin/bash

echo $1
DIR=$1

if [ -z "$DIR" ]
then
	echo "\$DIR is empty"
else
	echo "\$DIR is NOT empty"
	cd $DIR
fi

df >> df-pre.txt

find \
	~/ \
		-type d \
			\( \
					-name "Debug" \
					-o \
					-name "Release" \
					-o \
					-name "packages" \
			\) \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -rf {} \;

find \
	~/ \
		-type f \
			\( \
					-name ".DS_Store" \
					-o \
					-name "*.suo" \
					-o \
					-name "*.sdf" \
					-o \
					-name "*.csproj.user" \
					-o \
					-name "*.cxproj.user" \
					-o \
					-name "*.ncrunchsolution" \
					-o \
					-name "*.userprefs" \
					-o \
					-name "*.xam" \
			\) \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -rf {} \;


rm -fr ~/Library/Application\ Support/iPhone\ Simulator/6.1/Applications/*
rm -fr ~/Library/Application\ Support/iPhone\ Simulator/7.1/Applications/*
rm -fr ~/Library/Application\ Support/iPhone\ Simulator/7.0.3/Applications/*
rm -fr ~/Library/Application\ Support/iPhone\ Simulator/*

rm -fr ~/Library/Developer/Xcode/Archives/*
ls -al ~/Library/Developer/Xcode/Archives/

rm -fr ~/Library/Developer/Xcode/iOS\ Device\ Logs/*
ls -al ~/Library/Developer/Xcode/iOS\ Device\ Logs/

rm -fr ~/Library/Developer/Xcode/iOS\ DeviceSupport/*
ls -al ~/Library/Developer/Xcode/iOS\ DeviceSupport/


rm -fr ~/Library/Developer/Shared/Documentation/DocSets/com.apple.*
ls -al ~/Library/Developer/Shared/Documentation/DocSets/

#===============================================================================
# bunch of tmp stuff like:
#		kpm		old ASP.net v5 
#	
rm -fr ~/.local/share/kpm/
rm -fr ~/.local/share/Mono\ development\ team/
rm -fr ~/.local/share/MonoForAndroid/
rm -fr ~/.local/share/NuGet/
rm -fr ~/.local/share/Xamarin/
rm -fr ~/.local/share/XamarinInsights/Xamarin\ Android\ Player/
rm -fr ~/.local/share/XamarinInsights/XamarinStudio/

df >> df-post.txt
