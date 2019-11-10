
set sdkmanager="%SystemDrive%\bin\android\sdk\tools\bin\sdkmanager.bat"
set avdmanager="%SystemDrive%\bin\android\sdk\tools\bin\avdmanager.bat"

echo "" > %USERPROFILE%/.android/repositories.cfg

%sdkmanager% --licenses

%sdkmanager% --verbose "tools"
%sdkmanager% --verbose "platform-tools"
%sdkmanager% --verbose "extras;intel;Hardware_Accelerated_Execution_Manager"
%sdkmanager% --verbose "ndk-bundle"
%sdkmanager% --verbose "lldb;2.3"
%sdkmanager% --verbose "cmake;3.6.4111459"

; https://developer.android.com/studio/releases/platforms.html
%sdkmanager% --verbose "platforms;android-25" 
%sdkmanager% --verbose "platforms;android-24" 
%sdkmanager% --verbose "platforms;android-23" 
%sdkmanager% --verbose "platforms;android-22" 
%sdkmanager% --verbose "platforms;android-21" 
%sdkmanager% --verbose "platforms;android-19" 
%sdkmanager% --verbose "platforms;android-15" 
%sdkmanager% --verbose "platforms;android-14" 
%sdkmanager% --verbose "platforms;android-11" 
%sdkmanager% --verbose "platforms;android-10" 

; https://developer.android.com/studio/releases/build-tools.html
%sdkmanager% --verbose "build-tools;27.0.3" 
%sdkmanager% --verbose "build-tools;26.0.2" 
%sdkmanager% --verbose --uninstall "build-tools;25.0.2" 
%sdkmanager% --verbose "build-tools;25.0.3" 
%sdkmanager% --verbose "build-tools;24.0.3" 
%sdkmanager% --verbose "build-tools;25.0.3" 

; https://stackoverflow.com/questions/44167152/android-sdkmanager-available-packages/44228627

%sdkmanager% --verbose "system-images;android-10;google_apis;x86"
%sdkmanager% --verbose "system-images;android-15;google_apis;x86"
%sdkmanager% --verbose "system-images;android-16;google_apis;x86"
%sdkmanager% --verbose "system-images;android-19;google_apis;x86"
%sdkmanager% --verbose "system-images;android-21;google_apis;x86"
%sdkmanager% --verbose "system-images;android-23;google_apis;x86"
%sdkmanager% --verbose "system-images;android-24;google_apis;x86"
%sdkmanager% --verbose "system-images;android-25;google_apis;x86"
%sdkmanager% --verbose "system-images;android-26;google_apis;x86"

%sdkmanager% --verbose "system-images;android-21;android-tv;x86"
%sdkmanager% --verbose "system-images;android-22;android-tv;x86"
%sdkmanager% --verbose "system-images;android-23;android-tv;x86"
%sdkmanager% --verbose "system-images;android-24;android-tv;x86"
%sdkmanager% --verbose "system-images;android-25;android-tv;x86"

%sdkmanager% --verbose "system-images;android-25;android-wear;x86"
%sdkmanager% --verbose "system-images;android-25;android-wear;x86"


%sdkmanager% --verbose "extras;google;m2repository" 
%sdkmanager% --verbose ""
%sdkmanager% --verbose ""
%sdkmanager% --verbose ""
%sdkmanager% --verbose ""
%sdkmanager% --verbose ""
%sdkmanager% --verbose ""

extras;google;auto

%avdmanager%  --verbose list avd
echo. | %avdmanager% create avd ^
        --force ^
        --abi google_apis/x86 ^
        --name "AVDx86-google-apis-25-7.1-nougat" ^
        --package "system-images;android-25;google_apis;x86"
echo. | %avdmanager% create avd ^
        --force ^
        --abi google_apis/x86 ^
        --name "AVDx86-google-apis-26-8.0-oreo" ^
        --package "system-images;android-26;google_apis;x86"
%avdmanager%  --verbose list avd


; ANDROID_HOME="%ProgramFiles(x86)%\Android\android-sdk"
; ANDROID_NDK="C:\Program Files\Android\ndk\android-ndk-r11c"
; edit the system variables, 
;       setx
; administrative command prompt needed. 

setx ANDROID_HOME "%SystemDrive%\" /M
set  ANDROID_HOME="%SystemDrive%\bin\android\sdk\tools\bin"
ANDROID_NDK=""
ANDROID_NDK=""

; user
reg query HKEY_CURRENT_USER\Environment
reg query HKEY_CURRENT_USER\Environment /v ANDROID_HOME

; system
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH

