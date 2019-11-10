export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Sys.setlocale(category="LC_ALL", locale = "en_US.UTF-8")

export PATH=/Library/Frameworks/Mono.framework/Commands/:$PATH
export PATH=/usr/local/share/dotnet/:~/.dotnet/tools:$PATH

#-----------------------------------------------------------------------------------------------
export JAVA_HOME=/Projects/system-installed/macosx/jdk/microsoft_dist_openjdk_8.0.25/
# export JAVA_HOME=$HOME/Library/Developer/Xamarin/jdk/microsoft_dist_openjdk_1.8.0.9
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
# Android.Studio embedded JDK
# /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home
#-----------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------
export ANDROID_HOME=/Projects/system-installed/macosx/sdk/
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export ANDROID_NDK_HOME=$HOME/Library/Android/sdk/ndk-bundle
#...............................................................
# Folders (shared) used by several Windows VMs (Parallels and VM-Ware)
# ANDROID_HOME=/Projects/system-installed/windows/sdk/
# export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle
#-----------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------
export GITLAB_API_KEY=KKKKKKKKKKKKKKKEEEEEEEEEEEEEEEYYYYYYYYYYYYYYY
export GITLAB_API_PRIVATE_TOKEN=$GITLAB_API_KEY
export GITLAB_API_ENDPOINT=https://gitlab.com/api/v3
#-----------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------
# Go development - needed for Serialization Microsoft Bond
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
#-----------------------------------------------------------------------------------------------




#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------
export MD_FEATURES_ENABLED=IdeBuildOutputView
