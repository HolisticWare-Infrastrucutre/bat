#/bin/bash


rm -fr lib/
mkdir lib/

# build the i386 version of native library
xcodebuild \
	-sdk iphonesimulator \
	-arch i386 \
	-configuration Release \
	clean build
mv \
	build/Release-iphonesimulator/libTSMiniWebBrowserLibrary.a \
	lib/libTSMiniWebBrowserLibrary-i386.a


# build the ARMv6 version of native library
#xcodebuild \
#	-sdk iphoneos \
#	-arch armv6 \
#	-configuration Release clean build

# build the ARMv6 version of native library
xcodebuild \
	-sdk iphoneos \
	-arch armv7 \
	-configuration Release \
	clean build	
mv \
	build/Release-iphoneos/libTSMiniWebBrowserLibrary.a \
	lib/libTSMiniWebBrowserLibrary-armv7.a


xcodebuild \
	-sdk iphoneos \
	-arch armv7s \
	-configuration Release \
	clean build	
mv \
	build/Release-iphoneos/libTSMiniWebBrowserLibrary.a \
	lib/libTSMiniWebBrowserLibrary-armv7s.a


xcodebuild \
	-sdk iphoneos \
	-arch arm64 \
	-configuration Release \
	clean build	
mv \
	build/Release-iphoneos/libTSMiniWebBrowserLibrary.a \
	lib/libTSMiniWebBrowserLibrary-arm64.a
	
ls -al ./lib/

lipo \
	-create \
	-output lib/libTSMiniWebBrowserLibrary.a \
	lib/libTSMiniWebBrowserLibrary-i386.a \
	lib/libTSMiniWebBrowserLibrary-arm64.a \
	lib/libTSMiniWebBrowserLibrary-armv7.a \
	lib/libTSMiniWebBrowserLibrary-armv7s.a


lipo \
	-info \
	lib/libTSMiniWebBrowserLibrary.a 
