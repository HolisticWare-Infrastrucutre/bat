#!/bin/bash

echo $1
DIR=$1

sh ./clean-xamarin-mono-dotnet.sh

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
					-o \
					-name "DTAR_*_DTAR" \
					-o \
					-name ".vs" \
					-o \
					-name ".mfractor" \
					-o \
					-name ".droidres" \
					-o \
					-name ".idea" \
					-o \
					-name "__pycache__" \
					-o \
					-path "~/Library/Caches/Xamarin/AndroidDesigner" \
					-o \
					-path "~/Library/Caches/Xamarin/SystemDeviceDefinitions" \
					-o \
					-path "~/Library/Caches/Xamarin/VisualStudio" \
					-o \
					-path "~/Library/Caches/Xamarin/Xamarin.Android" \
					-o \
					-path "~/Library/Caches/Xamarin/XamarinBuildDownload" \
					-o \
					-path "~/Library/Caches/com.microsoft.visual-studio" \
					-o \
					-path "~/Library/Caches/Xamarin/mtbs/" \
					-o \
					-path "~/Library/Caches/Xamarin/XMA/" \
					-o \
					-path "~/Library/Caches/Xamarin.Android/" \
					-o \
					-path "~/Library/Caches/XamarinBuildDownload/" \
					-o \
					-path "~/.nuget/packages/" \
					-o \
					-path "~/Library/Caches/VisualStudio/" \
					-o \
					-path "~/Library/Caches/Rider2018*/" \
					-o \
					-path "~/Library/Caches/AndroidStudio*/" \
					-o \
					-path "com.microsoft.visual-studio-preview/" \
					-o \
					-path "com.operasoftware.Opera/" \
					-o \
					-path "com.microsoft.VSCode/" \
					-o \
					-path ".vscode/" \
					-o \
					-path "scriptcs_packages/" \
			\) \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-not -path "*.templateengine*" \
		-not -path "*.config/WakaTime/*" \
		-not -path "*.vscode/extensions/*" \
		-not -path "*/*XamarinComponents/*/.idea/*" \
		-exec rm -rf {} \;

find \
	~/ \
		-type f \
			\( \
					-name "._*" \
					-o \
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
					-o \
					-name "UpgradeLog*.htm" \
					-o \
					-name ".mfractor" \
					-o \
					-name ".droidres" \
					-o \
					-name "mono_crash.*.json" \
					-o \
					-name "omnisharp.json" \
			\) \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -rf {} \;


find \
	/Users/Shared//Projects/ \
		-type d \
			\( \
					-name "Debug" \
					-o \
					-name "Release" \
					-o \
					-name "packages" \
					-o \
					-name "DTAR_*_DTAR" \
					-o \
					-name ".vs" \
					-o \
					-name ".mfractor" \
					-o \
					-name ".droidres" \
					-o \
					-name ".idea" \
					-o \
					-name "__pycache__" \
					-o \
					-path "*/Library/Caches/Xamarin/AndroidDesigner" \
					-o \
					-path "*/Library/Caches/Xamarin/SystemDeviceDefinitions" \
					-o \
					-path "*/Library/Caches/Xamarin/VisualStudio" \
					-o \
					-path "*/Library/Caches/Xamarin/Xamarin.Android" \
					-o \
					-path "*/Library/Caches/Xamarin/XamarinBuildDownload" \
					-o \
					-path "*/Library/Caches/com.microsoft.visual-studio" \
			\) \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -rf {} \;

find \
	/Users/Shared//Projects/ \
		-type f \
			\( \
					-name "._*" \
					-o \
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
					-o \
					-name "UpgradeLog*.htm" \
			\) \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -rf {} \;

#---------------------------------------------------------------------------
# http://lastexitcode.com/projects/NuGet/FileLocations/
rm -fr ~/.nuget/packages/*
rm -fr ~/.local/share/NuGet/v3-cache/*
rm -fr ~/.local/share/NuGet/*cache/*
#---------------------------------------------------------------------------

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

# http://blog.neverthesamecolor.net/how-to-recover-disk-space-from-xcode/
#~/Library/Developer/Xcode/DerivedData
#~/Library/Developer/Xcode/Archives
#~/Library/Developer/Xcode/iOS DeviceSupport
#~/Library/Developer/CoreSimulator
#~/Library/Caches/com.apple.dt.Xcode
#~/Library/Application Support/MobileSync/Backup

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



rm -fr ~/.Bytecode-Viewer/
# rm -fr ~/octave/
rm -fr ~/android-archives/

df >> df-post.txt
