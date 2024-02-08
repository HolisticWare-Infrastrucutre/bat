setopt PROMPT_SUBST
# PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '
# PROMPT='$fg[cyan]%m:$fg[yellow] %T %B%30<..<%~%b %(!.#.>) '
PROMPT='%F{yellow}%3~%f %# '

echo "runing as   $(whoami)" 
echo "runing as   $(id -u)" 
echo "runing in   $(groups $(whoami) | cut -d' ' -f1)" 
echo "runing in   $(id -g)" 


# Terminal autocomplete fix
autoload -Uz compinit && compinit
autoload -U promptinit && promptinit

plugins=\
(
    git
    docker
    asdf
    zsh-autosuggestions
    zsh-completions 
    zsh-history-substring-search 
    zsh-syntax-highlighting
)

# prompt pure
# 
# compinit
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# fpath=(/usr/local/share/zsh-completions $fpath)

#autoload -U +X compinit && compinit
#autoload -U +X bashcompinit && bashcompinit 


#######################################################################################################################
#----------------------------------------------------------------------------------------------------------------------
# PATH

#----------------------------------------------------------------------------------------------------------------------
# ls -1 /Library/Java/JavaVirtualMachines/

# adoptopenjdk-8.jdk
# amazon-corretto-8.jdk
# jdk-21.jdk
# microsoft-11.jdk
# microsoft-16.jdk
# microsoft-17.jdk
# openjdk-8.jdk
# temurin-8.jdk
# zulu-8.jdk

export JAVA_HOME_ADOPTOPENJDK_8=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME_CORRETO_8=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_OEPNJDJ_8=/Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home
export JAVA_HOME_TEMURIN_8=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home
export JAVA_HOME_ZULU_8=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_MICROSOFT_11=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home
export JAVA_HOME_MICROSOFT_16=/Library/Java/JavaVirtualMachines/microsoft-16.jdk/Contents/Home
export JAVA_HOME_MICROSOFT_17=/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home
export JAVA_HOME_JDK_21=/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home

export JAVA_HOME_ANDROID_STUDIO=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
# export JAVA_HOME_MICROSOFT=$HOME/Library/Developer/Xamarin/jdk/microsoft_dist_openjdk_1.8.0.25
export JAVA_HOME_MICROSOFT=$JAVA_HOME_MICROSOFT_11

export JAVA_HOME=$JAVA_HOME_MICROSOFT
#----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------
# ANDROID_HOME
# ANDROID_SDK_ROOT
# installed with Visual Studio (Xamarin)
export ANDROID_HOME_XAMARIN=$HOME/Library/Developer/Xamarin/android-sdk-macosx
export ANDROID_NDK_HOME_XAMARIN=/usr/local/bin

# installed with Android Studio
export ANDROID_HOME_ANDROID_STUDIO=$HOME/Library/Android/sdk
# installed with brew
export ANDROID_HOME_BREW=/usr/local/share/android-sdk

export ANDROID_HOME=$ANDROID_HOME_ANDROID_STUDIO
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_NDK_HOME=$ANDROID_NDK_HOME_XAMARIN
export AndroidSdkDirectory=$ANDROID_HOME
#----------------------------------------------------------------------------------------------------------------------
export MONO_GAC_PREFIX="/opt/homebrew"


export PATH=/usr/bin/:/bin/:/usr/sbin/:/sbin/:/usr/local/bin/:/usr/local/sbin/
export PATH=/opt/homebrew/bin/:/opt/homebrew/sbin/:$PATH
export PATH=$PATH:$ANDROID_HOME/bin/
export PATH=$PATH:$ANDROID_HOME/tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/platform-tool/
export PATH=$PATH:$ANDROID_HOME/bundle-tool/
export PATH=$PATH:$ANDROID_SDK_ROOT/
export PATH=$PATH:$JAVA_HOME/
export PATH=$PATH:$JAVA_HOME/bin/
export PATH=$PATH:/usr/local/share/dotnet:$HOME/.dotnet/tools/
export PATH=$PATH:/usr/local/bin/pwsh/
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/"
#----------------------------------------------------------------------------------------------------------------------
#######################################################################################################################


#######################################################################################################################
alias ll='ls -al'

alias vs="open -a Visual\ Studio\ \(Preview\)"
alias vsc="code -n ."
# implemented as function
# alias rider="open -a Rider"

alias edge="open -a Microsoft\ Edge $1"
alias edge_beta="open -a Microsoft\ Edge\ Beta $1"

alias rstudio="open -a RStudio"

# alias edge="/Applications/Microsoft\ Edge.app/Contents/MacOS/Microsoft\ Edge"

#----------------------------------------------------------------------------------------------------------------------
## aliases cannot have arguments, using functions instead
setopt complete_aliases

# zsh parameter completion for the dotnet CLI

# if type brew &>/dev/null; then
#   HOMEBREW_PREFIX=/usr/local
#   if [[ -r /etc/profile.d/bash_completion.sh ]] ; 
#   then
#     source /etc/profile.d/bash_completion.sh
#   else
#     for COMPLETION in /etc/bash_completion.d/* ; 
#     do
#       [[ -r  ]] && source 
#     done
#   fi
# fi
#######################################################################################################################



#######################################################################################################################
# sys
# start

sys_postinstall()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sys_term_fingerprint
  sudo xcodebuild -license accept
  "
  # Agreeing to the Xcode/iOS license requires admin privileges, please run “sudo xcodebuild -license” and then retry 
  # this command.
  sys_term_fingerprint
  sudo xcodebuild -license accept
}

sys_diverse_clean()
{
  rm -fr .android/cache/
  rm -fr .android/build-cache/
  rm -fr .dotnet/TelemetryStorageService/
  rm -fr .dotnet/*rc*/
  rm -fr .dotnet/*preview*/

  rm -fr .cache/
  rm -fr .cocoapods/
  rm -fr .docker/
  rm -fr .gitlab-runner/
  rm -fr .gradle/
  rm -fr .julia/
  rm -fr .jupyter/
  rm -fr .kube/

  rm -fr .octave*
}


# stop
# sys
#######################################################################################################################


#######################################################################################################################
# sys
#   finder
# start

sys_finder_settings()
{
  # https://www.hexnode.com/mobile-device-management/help/script-to-customize-finder-preferences-on-mac/
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  defaults write NSGlobalDomain AppleShowAllExtensions -boolean true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -boolean true
  defaults write com.apple.finder FXEnableExtensionChangeWarning -boolean true
  defaults write com.apple.finder AppleShowAllFiles -boolean true
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  killall Finder
  "
  defaults write NSGlobalDomain AppleShowAllExtensions -boolean true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -boolean true
  defaults write com.apple.finder FXEnableExtensionChangeWarning -boolean true
  defaults write com.apple.finder AppleShowAllFiles -boolean true
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  killall Finder
}

sys_finder_open_windows_and_tabs()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/03-productivity/mac/finder-open-window-with-tabs.sh
  "
  source $HOME/bat/03-productivity/mac/finder-open-window-with-tabs.sh
}

# stop
#   finder
# sys
#######################################################################################################################



#======================================================================================================================
# sys   
#   term
# start

sys_term_tab_completion_reset()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  rm -f ~/.zcompdump
  "
  rm -f ~/.zcompdump
}

sys_term_autocompletion_reset()
{
  sys_term_tab_completion_reset
}

# source $HOME/bat/03-productivity/mac/clear-screen-and-term-buffer.sh
sys_term_clean_screen_and_buffer()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/zsh/functions/sys_term_clean_screen_and_buffer
  "
  source $HOME/bat/01-system-integration/mac/zsh/functions/sys_term_clean_screen_and_buffer
};

sys_term_fingerprint()
{
  #----------------------------------------------------------------------------------------------
  # fingerprint in terminal
  # sudo nano /etc/pam.d/sudo
  # add this at the begining
  # auth       sufficient     pam_tid.so

  #----------------------------------------------------------------------------------------------

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  echo "auth       sufficient     pam_tid.so" | cat - /etc/pam.d/sudo > /tmp/out \\
  && \
  sudo mv /tmp/out /etc/pam.d/sudo

  cat /etc/pam.d/sudo 
  "

  echo "auth       sufficient     pam_tid.so" | cat - /etc/pam.d/sudo > /tmp/out \
  && \
  sudo mv /tmp/out /etc/pam.d/sudo

  cat /etc/pam.d/sudo 
};

# stop
#   term
# sys   
#======================================================================================================================

#======================================================================================================================
# sys   
#   brew
# start
sys_brew_update_upgrade()
{
  sys_brew_clean

  brew update
  brew upgrade

  sys_brew_clean
}

sys_brew_clean()
{
    sys_term_clean_screen_and_buffer

    brew cleanup
    brew autoremove
    brew doctor
}

sys_brew_clean_update()
{
    sys_term_clean_screen_and_buffer

    brew cleanup
    brew autoremove

    brew update
    brew upgrade

    brew cleanup
    brew autoremove

    source $HOME/bat/01-system-integration/mac/02-install/download/brew-01-upgrade.sh
};

sys_brew_repair_installation()
{
    sys_term_clean_screen_and_buffer

    echo "export PATH=/opt/homebrew/bin/:$PATH" >> ~/.zshrc
    echo "export PATH=/opt/homebrew/sbin/:$PATH" >> ~/.zshrc
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew doctor
    eval $(/opt/homebrew/bin/brew shellenv)
    echo "eval $(/opt/homebrew/bin/brew shellenv)" >> ~/.zshrc
};

# stop
#   brew
# sys   
#======================================================================================================================


#======================================================================================================================
# sys   
#   zsh
# start

sys_zsh_functions_list()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  shell functions (bash/zsh) available:
  
  print -l ${(ok)functions}
  "
  print -l ${(ok)functions}
}

sys_zshrc_reload()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/.zshrc 
  "
  source $HOME/.zshrc 
}


sys_zsh_functions_load()
{

  fpath=($HOME/bat/01-system-integration/mac/zsh/functions $fpath);
  
  autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/dotnet_tools_update
  autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/launch_applications
  autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/disk_usage_android
  autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/markdown_bash_execute
  autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/mbe
  
  autoload bashcompinit && bashcompinit
#  source $(brew --prefix)/etc/bash_completion.d/az

}
#----------------------------------------------------------------------------------------------------------------------

# stop
#   zsh
# sys   
#======================================================================================================================


#======================================================================================================================
# sys   
#   network
# start

sys_network_restart()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  Restarting audio services:

  networksetup -listnetworkserviceorder

  sudo ifconfig en0 down
  sudo ifconfig en0 up
  "
  
  networksetup -listnetworkserviceorder
  
  sudo ifconfig en0 down
  sudo ifconfig en0 up
}


sys_network_restart_brute()
{
  # com.apple.airport.preferences.plist
  # com.apple.network.identification.plist
  # com.apple.network.eapolclient.configuration.plist
  # com.apple.wifi.message-tracer.plist
  # NetworkInterfaces.plist
  # preferences.plist

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export TIMESTAMP=$(date +%Y-%m-%dT%H-%M-%S)
  export DESTINATION=$HOME/Downloads/$TIMESTAMP
  mkdir $DESTINATION
  cd /Library/Preferences/SystemConfiguration/
  mv \\
    com.apple.airport.preferences.plist \\
    $DESTINATION
  mv \\
    com.apple.network.identification.plist \\
    $DESTINATION
  mv \\
    com.apple.network.eapolclient.configuration.plist \\
    $DESTINATION
  mv \\
    com.apple.wifi.message-tracer.plist \\
    $DESTINATION
  mv \\
    NetworkInterfaces.plist \\
    $DESTINATION
  mv \\
    preferences.plist \\
    $DESTINATION
  "

  export TIMESTAMP=$(date +%Y-%m-%dT%H-%M-%S)
  export DESTINATION=$HOME/Downloads/$TIMESTAMP
  mkdir $DESTINATION
  cd /Library/Preferences/SystemConfiguration/
  mv \
    com.apple.airport.preferences.plist \
    $DESTINATION
  mv \
    com.apple.network.identification.plist \
    $DESTINATION
  mv \
    com.apple.network.eapolclient.configuration.plist \
    $DESTINATION
  mv \
    com.apple.wifi.message-tracer.plist \
    $DESTINATION
  mv \
    NetworkInterfaces.plist \
    $DESTINATION
  mv \
    preferences.plist \
    $DESTINATION

}

# sys   
#   network
# stop
#======================================================================================================================

#======================================================================================================================
# sys   
#   audio
# start

sys_audio_restart_kill_9()
{
  # sudo pkill -9 coreaudiod kills the coreaudio process immediately. 
  # MacOS will automatically restart the coreaudio daemon, which will fix audio output in most cases.

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  Restarting audio services:

  sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`
  "
  sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`
}

sys_audio_restart_pkill_9()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  Restarting audio services:

  sudo pkill -9 coreaudiod
  "
  sudo pkill -9 coreaudiod
}

sys_audio_restart_kext_reload()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  Restarting audio services:

  sudo kextunload /System/Library/Extensions/AppleHDA.kext 
  sudo kextload /System/Library/Extensions/AppleHDA.kext
  "
  sudo kextunload /System/Library/Extensions/AppleHDA.kext 
  sudo kextload /System/Library/Extensions/AppleHDA.kext
}

sys_audio_restart_launchctl_stop()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  Restarting audio services:

  sudo launchctl stop   com.apple.audio.coreaudiod 
  sudo launchctl start  com.apple.audio.coreaudiod 
  "
  sudo launchctl stop   com.apple.audio.coreaudiod 
  sudo launchctl start  com.apple.audio.coreaudiod 
}

# stop
#   audio
# sys   
#======================================================================================================================


#======================================================================================================================
# dev   
# start

dev_info_dump_long()
{
  echo "=============================================================================================================="
  echo \
  "
  dev_dotnet_info_dump 
  dev_android_info_dump
  dev_ios_info_dump
  "

  dev_dotnet_info_dump 
  dev_android_info_dump
  dev_ios_info_dump
}

# stop
# dev   
#======================================================================================================================


#======================================================================================================================
# dev   
#   jdk
# start

jdk()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  version=$1
  unset JAVA_HOME;
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
  "
  version=$1
  unset JAVA_HOME;
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}


# stop
#   jdk
# dev   
#======================================================================================================================


#======================================================================================================================
# dev   
#   android
# start

dev_android_info_dump()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  echo "Google Android"
  echo "JAVA_HOME"
  echo $JAVA_HOME
  echo "ANDROID_SDK_ROOT"
  echo $ANDROID_SDK_ROOT
  echo "ANDROID_HOME"
  echo $ANDROID_HOME

  echo "/Applications/Android Studio Preview.app/Contents/MacOS/studio" -version
  "/Applications/Android Studio Preview.app/Contents/MacOS/studio" -version
}

dev_android_sdkmanager()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

  sdkmanager \
      --update

  sdkmanager \
      --install \
          \"cmdline-tools;latest\"

  sdkmanager \
      --licenses
  "
  # java 8 is required
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

  sdkmanager \
      --update

  sdkmanager \
      --install \
          "cmdline-tools;latest"

  # run following from the command-line if:
  # - Android Studio is not installed, or 
  # - it is for a CI server or other headless Linux device without a GUI installed
  sdkmanager \
      --licenses

  # sdkmanager \
  #     "platforms;android-25" \
  #     "build-tools;25.0.2" \
  #     "extras;google;m2repository" \
  #     "extras;android;m2repository"
}

dev_android_info_disk_usage()
{
  [ -d $ANDROID_HOME_XAMARIN ]        && echo "ANDROID_HOME_XAMARIN"        && du -sh $ANDROID_HOME_XAMARIN
  [ -d $ANDROID_HOME_ANDROID_STUDIO ] && echo "ANDROID_HOME_ANDROID_STUDIO" && du -sh $ANDROID_HOME_ANDROID_STUDIO
  [ -d $ANDROID_HOME_BREW ]           && echo "ANDROID_HOME_BREW"           && du -sh $ANDROID_HOME_BREW
}

dev_android_apk_analysis()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  java -jar $HOME/bin/classy-shark/ClassyShark.jar
  "
  java -jar $HOME/bin/classy-shark/ClassyShark.jar
}

dev_android_emulator_list()
{
  # start Android emulator to gain some time
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  $HOME/Library/Android/sdk/emulator/emulator \\
  -list-avds
  "
  echo
  $HOME/Library/Android/sdk/emulator/emulator \
    -list-avds
};

dev_android_emulator_reboot()
{
  echo "--------------------------------------------------------------------------------------------------------------"  
  echo \
  "
  adb -e reboot
  "
  adb -e reboot
  # ????
  # adb reboot
  # ????
}

dev_android_emulator_launch()
{
  echo "--------------------------------------------------------------------------------------------------------------"  
  echo "First argument: $1"

  if [ $# -lt 1 ]
  then
    echo "Usage: dev_android_emulator_launch <emulator_name>"

    dev_android_emulator_list
    
    return
  fi

  echo \
  "
  $HOME/Library/Android/sdk/emulator/emulator \\
    -avd "$1" \\
    -no-cache \\
    -no-snapshot-load \\
    &
  "
  #$HOME/Library/Developer/Xamarin/android-sdk-macosx/emulator/emulator 
  $HOME/Library/Android/sdk/emulator/emulator \
    -avd "$1" \
    &
};

dev_android_emulator_reset()
{
  echo "--------------------------------------------------------------------------------------------------------------"  
  echo \
  "
  sudo rm -fr $($HOME/.android/avd/Pixel_3a_API_34_extension_level_7_arm64-v8a.avd/*.img)
  sudo rm -fr $($HOME/.android/avd/nexus_9_api_33.avd/*.img) 
  "
  sudo rm -fr $($HOME/.android/avd/Pixel_3a_API_34_extension_level_7_arm64-v8a.avd/*.img)
  sudo rm -fr $($HOME/.android/avd/nexus_9_api_33.avd/*.img) 
}

dev_android_emulator_avds_all_rm_img_data()
{
  echo "--------------------------------------------------------------------------------------------------------------"  
  echo \
  "
  find $HOME/.android/avd/ -iname "*.avd" 
  rm -fr $(find $HOME/.android/avd/ -iname "*.img") 
  "
  find $HOME/.android/avd/ -iname "*.avd" 
  rm -fr $(find $HOME/.android/avd/ -iname "*.img") 
}


dev_android_emulator_launch_wipe_data_no_cache_no_snapshot()
{
  echo "--------------------------------------------------------------------------------------------------------------"  
  echo "First argument: $1"

  if [ $# -lt 1 ]
  then
    echo "Usage: dev_android_emulator_launch <emulator_name>"

    dev_android_emulator_list
    
    return
  fi

  echo \
  "
  $HOME/Library/Android/sdk/emulator/emulator \
    -avd "$1" \
    -wipe-data \
    -no-cache \
    -no-snapshot-load \
    &
  "
  #$HOME/Library/Developer/Xamarin/android-sdk-macosx/emulator/emulator 
  $HOME/Library/Android/sdk/emulator/emulator \
    -avd "$1" \
    -no-cache \
    -no-snapshot-load \
    &
};

# https://developer.android.com/tools/adb
# https://gist.github.com/Pulimet/5013acf2cd5b28e55036c82c91bd56d8
# https://technastic.com/adb-shell-commands-list/
# https://technastic.com/adb-shell-commands-list/
# https://hack.technoherder.com/adb-shell/

dev_android_adb_fastboot()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  adb reboot bootloader


  fastboot devices
  fastboot erase userdata
  fastboot erase cache
  "
  adb reboot bootloader
}

dev_android_adb_reset()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
    adb kill-server
    adb start-server
    adb devices
    adb devices -l
  "

    adb kill-server
    adb start-server
    adb devices
    adb devices -l
}

dev_android_shell_pm_list_users()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
    adb shell pm list users
  "

    adb shell pm list users
}

dev_android_adb_devices()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
    adb devices
    adb devices -l
  "

  adb devices
  adb devices -l
}

dev_android_shell_pm_list_users()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
    adb shell \\
      getprop ro.build.version.release 
  "

    adb shell \
      getprop ro.build.version.release 
}

dev_android_adb_logcat_buffers_clear_non_rooted()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  adb logcat -c
  "

  adb logcat -c
}

dev_android_adb_logcat_buffers_clear_rooted()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  adb root
  adb logcat -b all -c
  adb root
  adb shell logcat -b all -c
  "

  adb root
  adb logcat -b all -c
  adb root
  adb shell logcat -b all -c
}

dev_android_adb_logcat_buffers_clear_all()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dev_android_adb_logcat_buffers_clear_rooted
  dev_android_adb_logcat_buffers_clear_non_rooted
  "

  dev_android_adb_logcat_buffers_clear_rooted
  dev_android_adb_logcat_buffers_clear_non_rooted
}

dev_android_adb_logcat_mono_log_init()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dev_android_adb_logcat_clear
  adb logcat -G 64M 
  adb shell \\
    setprop debug.mono.log default,debugger,assembly,mono_log_level=debug,mono_log_mask=all
  "

  dev_android_adb_logcat_clear
  adb logcat -G 64M 
  adb shell \
    setprop debug.mono.log default,debugger,assembly,mono_log_level=debug,mono_log_mask=all
};

dev_android_adb_logcat_mono_trace_init()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dev_android_adb_logcat_clear
  adb logcat -G 64M 
  adb shell \\
    setprop debug.mono.trace all
  "

  dev_android_adb_logcat_clear
  adb logcat -G 64M 
  adb shell \
    setprop debug.mono.trace all
};

dev_android_adb_logcat_collect()
{
  export TIMESTAMP=$(date +%Y-%m-%dT%H-%M-%S)

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  adb logcat -d > log_$TIMESTAMP.txt
  adb bugreport
  "
  
  adb logcat -d > log_$TIMESTAMP.txt
};

dev_android_adb_bugreport()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  adb bugreport
  adb shell ls /bugreports/
  adb pull /bugreports/
  "
  
  adb bugreport
}

dev_android_emulator_list()
{
  $HOME/Library/Android/sdk/emulator/emulator \
    -list-avds
};



dev_android_decompile_jar_jar()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
    echo "$*"
    echo "using jar to decompile" $1
    echo "jar tf $1"
    jar tf $1
};

dev_android_decompile_jar_unzip()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
    echo "$*"
    echo "using unzip to decompile" $1
    echo "unzip -l $1"
    unzip -l $1
};

dev_android_decompile_jar_jadx()
{ 
    echo "--------------------------------------------------------------------------------------------------------------"
    echo "$*"
    echo "using jadx to decompile" $1
    echo "-------------------------------------------------------------------------------"
    $HOME/bin/jd-gui/bin/jadx --help
    export TIMESTAMP=$(date +%Y-%m-%dT%H-%M-%S)
    echo "-------------------------------------------------------------------------------"
    echo "$HOME/bin/jd-gui/bin/jadx $1"
    $HOME/bin/jd-gui/bin/jadx \
      --output-dir hw-jadx-$TIMESTAMP \
      $1 
}

dev_android_decompile_jar_luyten()
{ 
    echo "--------------------------------------------------------------------------------------------------------------"
    echo "$*"
    echo "launching luyten to decompile" $1.
    echo "java -jar $HOME/bin/Luyten/luyten.jar"
    echo "Drag & Drop jar to decompile..."
    echo "Luyten has no commandline support [yet]"
    java -jar $HOME/bin/Luyten/luyten.jar $1
}

# stop
#   android
# dev   
#======================================================================================================================


#======================================================================================================================
# dev   
#   ios
# start

dev_ios_info_dump()
{ 
  echo "=============================================================================================================="
  echo "Apple iOS/MacOS"

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  /usr/bin/xcodebuild -version
  "
  /usr/bin/xcodebuild -version

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  softwareupdate --history
  "
  softwareupdate --history
}

dev_ios_xcode_commandline_tools()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install
  softwareupdate --all --install --force
  "

  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install
  softwareupdate --all --install --force
}

# stop
#   ios
# dev   
#======================================================================================================================


#======================================================================================================================
# dev   
#   dotnet
# start

dev_dotnet_folders_nuke()
{ 
  echo "=============================================================================================================="
  echo \
  "
  rm -fr $(find . -type d -iname "bin" -o -iname "obj" -o -iname ".meteor" -o -iname ".idea" -o -iname ".vs")
  "

  rm -fr $(find . -type d -iname "bin" -o -iname "obj" -o -iname ".meteor" -o -iname ".idea" -o -iname ".vs")
}

dev_dotnet_nuget_nuke()
{ 
  echo "=============================================================================================================="
  echo \
  "
  source $HOME/bat/01-system-integration/mac/nuget/clean.sh
  "

  source $HOME/bat/01-system-integration/mac/nuget/clean.sh
}

dev_dotnet_info_dump()
{
  echo "=============================================================================================================="
  echo \
  "
  Microsoft .NET 
  "
  echo \
  "
  dotnet --info
  "
  dotnet --info
  
  echo \
  "
  dotnet --list-runtimes
  "
  dotnet --list-runtimes
  echo \
  "
  dotnet --list-sdks
  "  
  dotnet --list-sdks  

  echo \
  "
  dev_dotnet_workloads_list
  "  
  dev_dotnet_workloads_list
}

dev_dotnet_info_dump_long()
{ 
  echo "=============================================================================================================="
  echo \
  "
  Microsoft .NET 
  "
  echo \
  "
  dotnet --info
  "
  dotnet --info
  
  echo \
  "
  dotnet --list-runtimes
  "
  dotnet --list-runtimes
  echo \
  "
  dotnet --list-sdks
  "  
  dotnet --list-sdks  
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet workload list
  "
  dotnet workload list
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet workload list --machine-readable
  "
  dotnet workload list --machine-readable
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet workload update --print-rollback
  "
  dotnet workload update --print-rollback

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet tool list --global
  "
  dotnet tool list --global
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet new --list
  "
  dotnet new --list
}

dev_dotnet_installation_clean()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo rm -fr \
      /usr/local/share/dotnet/sdk/* \
      /usr/local/share/dotnet/sdk-manifests/* \
      /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App/* \
      /usr/local/share/dotnet/shared/Microsoft.NETCore.App/* \
  "
  sudo rm -fr \
      /usr/local/share/dotnet/sdk/* \
      /usr/local/share/dotnet/sdk-manifests/* \
      /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App/* \
      /usr/local/share/dotnet/shared/Microsoft.NETCore.App/* \

}

dev_dotnet_workloads_list()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet workload list
  "
  dotnet workload list
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet workload list --machine-readable
  "
  dotnet workload list --machine-readable
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet workload update --print-rollback
  "
  dotnet workload update --print-rollback
}

dev_dotnet_workloads_reinstall()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/dotnet/workload/install.sh

  dev_dotnet_workloads_list
  "
  source $HOME/bat/01-system-integration/mac/dotnet/workload/install.sh

  dev_dotnet_workloads_list
};

dev_dotnet_workloads_clean()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo dotnet workload clean
#  sudo dotnet workload clean --all
  dev_dotnet_workloads_list
  "
  sudo dotnet workload clean
#  sudo dotnet workload clean --all
  dev_dotnet_workloads_list
}

dev_dotnet_tools_reinstall()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/dotnet/tool/install.sh

  dotnet tool \
    uninstall \
      Cake.Tool \
      --global \

  dotnet tool \
    install \
      --global \
        Cake.Tool \
        --add-source https://pkgs.dev.azure.com/cake-build/Cake/_packaging/cake/nuget/v3/index.json \
        --version 3.2.0-alpha0025  

  "
  source $HOME/bat/01-system-integration/mac/dotnet/tool/install.sh 

  dotnet tool \
    uninstall \
      --global \
      Microsoft.DotNet.XHarness.CLI 

dotnet tool \
  install \
    Microsoft.DotNet.XHarness.CLI \
      --global \
      --add-source https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-eng/nuget/v3/index.json \
      --prerelease \
      --verbosity:diag \

  dotnet tool \
    uninstall \
      Cake.Tool \
      --global \

  dotnet tool \
    install \
      --global \
        Cake.Tool \
        --add-source https://pkgs.dev.azure.com/cake-build/Cake/_packaging/cake/nuget/v3/index.json \
        --prerelease \
        --verbosity:diag \

#        --version 3.2.0-alpha0025  
}

dev_dotnet_tools_reinstall_api_tools()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/dotnet/tool/api-tools-private.sh
  "
  source $HOME/bat/01-system-integration/mac/dotnet/tool/api-tools-private.sh
}

dev_dotnet_new_templates_reinstall()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install.sh
  "
  source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install.sh 
};

dev_dotnet_tool_cake_install_2_3_0()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  dotnet tool \
    uninstall \
      --global \
        Cake.Tool

  dotnet tool \
    install \
      --global \
        Cake.Tool \
          --version 2.3.0
}

dev_dotnet_clean()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  rm -fr .dotnet/
  source $HOME/bat/01-system-integration/mac/nuget/clean.sh

  rm -fr .mono/
  rm -fr .omnisharp/
  rm -fr .npm/

  rm -fr .quicktype-vscode/
  rm -fr .vs-kubernetes/
  rm -fr .vscode-insiders/
  rm -fr .vscode*
  "

  rm -fr .dotnet/
  source $HOME/bat/01-system-integration/mac/nuget/clean.sh

  rm -fr .mono/
  rm -fr .omnisharp/
  rm -fr .npm/

  rm -fr .quicktype-vscode/
  rm -fr .vs-kubernetes/
  rm -fr .vscode-insiders/
  rm -fr .vscode*
}

dev_dotnet_ide_rider()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  open -a \
    Rider \
      --args \
        $1
  "
  open -a \
    Rider \
      --args \
        $1
  # /Applications/Rider.app/Contents/MacOS/rider
}

dev_dotnet_msbuildlog ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet $HOME/bin/msbuildlog/bin/StructuredLogViewer.Avalonia.dll
  "
  dotnet $HOME/bin/msbuildlog/bin/StructuredLogViewer.Avalonia.dll
}


# https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete
dev_dotnet_tab_completion_zsh()
{
#  echo "--------------------------------------------------------------------------------------------------------------"
#  echo \
#  "
#  local completions=(\"$(dotnet complete \"$words\")\")
#
#  # If the completion list is empty, just continue with filename selection
#  if [ -z \"$completions\" ]
#  then
#    _arguments '*::arguments: _normal'
#    return
#  fi
#
#  # This is not a variable assignment, don't remove spaces!
#  _values = \"${(ps:\\n:)completions}\"
#  "
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef dev_dotnet_tab_completion_zsh dotnet

# function dev_dotnet_tab_completion_bash()
# {
#   local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n' # On Windows you may need to use use IFS=$'\r\n'
#   local candidates
# 
#   read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)
# 
#   read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
# }
# 
# complete -f -F dev_dotnet_tab_completion_bash dotnet

# dev_dotnet_autocomplete ()
# {
#   # https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#bash
#   # https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#zsh
# 
#   local completions=("$(dotnet complete "$words")")
# 
#   # If the completion list is empty, just continue with filename selection
#   if [ -z "$completions" ]
#   then
#     _arguments '*::arguments: _normal'
#     return
#   fi
# 
#   # This is not a variable assignment, don't remove spaces!
#   _values = "${(ps:\n:)completions}"  
# }

# compdef dev_dotnet_autocomplete dotnet
compdef dev_dotnet_tab_completion_zsh dotnet

# https://docs.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete
# dotnet_zsh_complete()
# {
#   local completions=("$(dotnet complete "$words")")
# 
#   reply=( "${(ps:\n:)completions}" )
# 
#   compctl -K dotnet_zsh_complete dotnet
# }

dev_dotnet_assembly_references ()
{  
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  for f in $(find $FIND_ROOT -type f -iname \"*.dll\") ;
  do 
    echo \"## \" $f ;
    monodis --assemblyref $f ; 
  done
  "
  if [ $# -lt 1 ]
  then
    echo "Usage: dev_dotnet_assembly_references <folder_root>"

    export FIND_ROOT=.
  else
    export FIND_ROOT=$1
  fi

  for f in $(find $FIND_ROOT -type f -iname "*.dll") ;
  do 
    echo "## " $f ;
    monodis --assemblyref $f ; 
  done
}

# stop
#   dotnet
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   code vscode
# start

# Windows   %USERPROFILE%\.vscode\extensions
# macOS     $HOME/.vscode/extensions
# Linux     $HOME/.vscode/extensions

dev_code_vscode_backups ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  tree "$HOME/Library/Application Support/Code/Backups"
  "
  tree "$HOME/Library/Application Support/Code/Backups"

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  tree "$HOME/Library/Application Support/Code - Insiders/Backups"
  "
  tree "$HOME/Library/Application Support/Code - Insiders/Backups"
}

dev_code_vscode_extensions_list ()
{
  # https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  code \
    --list-extensions
  "
  code \
    --list-extensions
}

dev_code_vscode_extensions_list_versions ()
{
  # https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  code \
    --list-extensions \
    --show-versions \
  "
  code \
    --list-extensions \
    --show-versions \

}

dev_code_vscode_insiders_extensions_list ()
{
  # https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  code-insiders \
    --list-extensions
  "
  code-insiders \
    --list-extensions
}

dev_code_vscode_insiders_extensions_list_versions ()
{
  # https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  code-insiders \
    --list-extensions \
    --show-versions \
  "
  code-insiders \
    --list-extensions \
    --show-versions \

}

# stop
#   code vscode
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   dotnet
#       android
# start

dev_dotnet_android_bindings_binderator_clean()
{
  echo "=============================================================================================================="
  echo \
  "
  rm -fr output externals generated && dotnet cake -t=clean && git clean -xdf \\
  && \\
  sys_term_clean_screen_and_buffer && git pull && git status
  "
  rm -fr output externals generated && dotnet cake -t=clean && git clean -xdf \
  && \
  sys_term_clean_screen_and_buffer && git pull && git status

}

dev_dotnet_android_bindings_binderator_build()
{
  echo "=============================================================================================================="
  echo \
  "
  dotnet cake -t=ci \\
  && \\
  dotnet \\
  cake nuget-diff.cake -v:diagnostic \\
  && \\
  dotnet cake utilities.cake  
  "
  dotnet cake -t=ci \
  && \
  dotnet \
  cake nuget-diff.cake -v:diagnostic \
  && \
  dotnet cake utilities.cake  
}

dev_dotnet_android_bindings_binderator_config_update()
{ 
  echo "=============================================================================================================="
  # dotnet script update-config.csx -- ./config.json <update|bump|published|sort>
  echo \
  "
  dotnet script ./build/scripts/update-config.csx -- ./config.json update
  "
  dotnet script ./build/scripts/update-config.csx -- ./config.json update
}  

dev_dotnet_android_bindings_binderator_config_bump()
{ 
  echo "=============================================================================================================="
  # dotnet script update-config.csx -- ./config.json <update|bump|published|sort>
  echo \
  "
  dotnet script ./build/scripts/update-config.csx -- ./config.json bump
  "
  dotnet script ./build/scripts/update-config.csx -- ./config.json bump
}

# stop
#       android
#   dotnet
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   dotnet
#       maui
# start

dev_dotnet_maui_new_lib ()
{
  TIMESTAMP=$( date "+%Y%m%d%H%M%S" )
  echo    $TIMESTAMP

  dotnet \
      new \
          mauilib \
              --output ./LibraryMAUI.$TIMESTAMP
}

dev_dotnet_maui_new_app ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  TIMESTAMP=$( date "+%Y%m%d%H%M%S" )
  echo    $TIMESTAMP

  dotnet \
      new \
          maui \
              --output ./AppMAUI.$TIMESTAMP
}

dev_dotnet_maui_new_app_hybrid_blazor ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  TIMESTAMP=$( date "+%Y%m%d%H%M%S" )
  echo    $TIMESTAMP

  dotnet \
      new \
          maui-blazor \
              --output ./AppMAUI.HybridBlazor.$TIMESTAMP  
}

dev_dotnet_maui_new_all ()
{
  dev_dotnet_maui_new_lib
  dev_dotnet_maui_new_app
  dev_dotnet_maui_new_app_hybrid_blazor
};

dev_dotnet_maui_build_lib ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  csproj=( $(find . -name "LibraryMAUI.*.csproj") )
  
  for csp in ${csproj[@]} ; 
  do
    echo "$csp"

    dotnet \
      build \
        $csp
  done
}

dev_dotnet_maui_build_app ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  csproj=( $(find . -name "AppMAUI.*.csproj") )
  
  for csp in ${csproj[@]} ; 
  do
    echo "$csp"

    dotnet \
      watch \
        build \
          $csp
  done
}

dev_dotnet_maui_build_app_hybrid_blazor ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  csproj=( $(find . -name "AppMAUI.HybridBlazor.*.csproj") )
  
  for csp in ${csproj[@]} ; 
  do
    echo "$csp"

    dotnet \
      watch \
        build \
          $csp
  done
}

dev_dotnet_maui_build_all ()
{
  dev_dotnet_maui_build_lib
  dev_dotnet_maui_build_app
  dev_dotnet_maui_build_app_hybrid_blazor
};

dev_dotnet_maui_run_app_android ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo $1
  echo $2
  echo $3

  for d in AppMAUI.*/ ; 
  do
    echo "$d"

    echo \
    "
    dotnet \
      watch \
        build \
            $d \
            -t:Run \
            -f:net7.0-android \
            /p:AndroidSdkDirectory=$ANDROID_HOME
    "

    dotnet \
      watch \
        build \
            $d \
            -t:Run \
            -f:net7.0-android \
            /p:AndroidSdkDirectory=$ANDROID_HOME

  done
}

dev_dotnet_maui_run_app_ios ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  for d in AppMAUI.*/ ; 
  do
    echo "$d"

    echo \
    "
    dotnet \
      watch \
        build \
          $d \
          -t:Run \
            -f:net7.0-ios \
            -p:_DeviceName=:v2:udid=$IOS_DEVICE_ID
    "

    dotnet \
      watch \
        build \
          $d \
          -t:Run \
            -f:net7.0-ios \
            -p:_DeviceName=:v2:udid=$IOS_DEVICE_ID



  done
}

dev_dotnet_maui_build_app_hybrid_blazor ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  for d in AppMAUI.HybridBlazor.*/ ; 
  do
      echo "$d"
        dotnet \
          build \
            $d
  done
}

#----------------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------
dev_dotnet_maui_repo_build_buildtasks ()
{
  dotnet tool restore
  dotnet cake \
    --target=dotnet-buildtasks \
    --configuration="Release" \
    --workloads=global
}

dev_dotnet_maui_repo_tools_tests_init ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  brew install \\
      node \\
      carthage      
  "
}

dev_dotnet_maui_repo_tools_tests_verify ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  appium-doctor --android
  "
  appium-doctor --android

}

dev_dotnet_maui_repo_build_device_tests ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  dev_dotnet_maui_repo_build_device_tests_maccatalyst
  dev_dotnet_maui_repo_build_device_tests_ios
  dev_dotnet_maui_repo_build_device_tests_android
}

dev_dotnet_maui_repo_build_device_tests_maccatalyst ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  export PWD=$(pwd)
  export PROJECTS=\
"
src/Core/tests/DeviceTests/Core.DeviceTests.csproj
src/Controls/tests/DeviceTests/Controls.DeviceTests.csproj
src/Graphics/tests/DeviceTests/Graphics.DeviceTests.csproj
src/BlazorWebView/tests/MauiDeviceTests/MauiBlazorWebView.DeviceTests.csproj
"

  IFS=$'\n'
  # ZSH does not split words by default (like other shells):
  setopt sh_word_split

  for PROJECT in $PROJECTS ; 
  do
    echo "--------------------------------------------------------------------------------------------------------------"
    echo $PROJECT
    echo \
    "
    dotnet cake \\
      -script eng/devices/catalyst.cake \\
      --verbosity=diagnostic \\
      --project="$PWD/$PROJECT" \\
      --device=maccatalyst \\
      --workloads=global
    "
  
    dotnet cake \
      -script eng/devices/catalyst.cake \
      --verbosity=diagnostic \
      --project="$PWD/$PROJECT" \
      --device=maccatalyst  \
      --workloads=global
  done
}

dev_dotnet_maui_repo_build_device_tests_android ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  export PWD=$(pwd)
  export PROJECTS=\
"
src/Core/tests/DeviceTests/Core.DeviceTests.csproj
src/Controls/tests/DeviceTests/Controls.DeviceTests.csproj
src/Graphics/tests/DeviceTests/Graphics.DeviceTests.csproj
src/BlazorWebView/tests/MauiDeviceTests/MauiBlazorWebView.DeviceTests.csproj
"

  IFS=$'\n'
  # ZSH does not split words by default (like other shells):
  setopt sh_word_split

  for PROJECT in $PROJECTS ; 
  do
    echo "--------------------------------------------------------------------------------------------------------------"
    echo $PROJECT
    echo \
    "
    dotnet cake \\
      -script eng/devices/android.cake \\
      --project="$PWD/$PROJECT" \\
      --device=ios-simulator-64  \\
      --workloads=global
    "
  
    dotnet cake \
      -script eng/devices/android.cake \
      --project="$PWD/$PROJECT" \
      --device=ios-simulator-64  \
      --workloads=global
  done
}

dev_dotnet_maui_repo_build_device_tests_ios ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  export PWD=$(pwd)
  export PROJECTS=\
"
src/Core/tests/DeviceTests/Core.DeviceTests.csproj
src/Controls/tests/DeviceTests/Controls.DeviceTests.csproj
src/Graphics/tests/DeviceTests/Graphics.DeviceTests.csproj
src/BlazorWebView/tests/MauiDeviceTests/MauiBlazorWebView.DeviceTests.csproj
"

  IFS=$'\n'
  # ZSH does not split words by default (like other shells):
  setopt sh_word_split

  for PROJECT in $PROJECTS ; 
  do
    echo "--------------------------------------------------------------------------------------------------------------"
    echo $PROJECT
    echo \
    "
    dotnet cake \\
      -script eng/devices/ios.cake \\
      --project="$PWD/$PROJECT" \\
      --device=ios-simulator-64  \\
      --workloads=global
    "
  
    dotnet cake \
      -script eng/devices/ios.cake \
      --project="$PWD/$PROJECT" \
      --device=ios-simulator-64  \
      --workloads=global
  done
}

dev_dotnet_maui_repo_build_visual_studio ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet tool restore
  dotnet cake \
    --target=VS \
    --workloads=global
  dotnet cake \
    --target=VS \
    --workloads=global \
      --android \
      --ios  \
      --catalyst
  "

  dotnet tool restore
  dotnet cake \
    --target=VS \
    --workloads=global
  dotnet cake \
    --target=VS \
    --workloads=global \
      --android \
      --ios  \
      --catalyst
}

dev_dotnet_maui_repo_build_visual_studio_code ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
    dotnet tool restore
    dotnet cake --target=VSCode --workloads=global
    dotnet cake --target=VSCode --workloads=global \
        --android \
        --ios  \
        --catalyst
  "

  dotnet tool restore
  dotnet cake --target=VSCode --workloads=global
  dotnet cake --target=VSCode --workloads=global \
      --android \
      --ios  \
      --catalyst
}

dev_dotnet_maui_repo_build_projects ()
{
  csproj=( $(find . -type f -iname "*.csproj") )
  for csp in ${csproj[@]} ; 
  do
    if echo $csp | grep -iqF unittest ;
    then
      break 1
    fi
    if echo $csp | grep -iqF uitest ;
    then
      break 2
    fi
    if echo $csp | grep -iqF devicetest ;
    then
      break 3
    fi

    echo "--------------------------------------------------------------------------------------------------------------"
    echo $csp  
    dotnet build $csp
  done
}

dev_dotnet_maui_repo_build_unit_tests ()
{
  export PROJECTS=\
"
./src/Core/tests/UnitTests/Core.UnitTests.csproj
./src/Compatibility/Core/tests/WinUI/Compatibility.Windows.UnitTests.csproj
./src/Compatibility/Core/tests/Compatibility.UnitTests/Compatibility.Core.UnitTests.csproj
./src/Compatibility/Core/tests/Android/Compatibility.Android.UnitTests.csproj
./src/Compatibility/Core/tests/iOS/Compatibility.iOS.UnitTests.csproj
./src/Essentials/test/UnitTests/Essentials.UnitTests.csproj
./src/SingleProject/Resizetizer/test/UnitTests/Resizetizer.UnitTests.csproj
./src/Controls/Foldable/test/Controls.DualScreen.UnitTests.csproj
./src/Controls/tests/Xaml.UnitTests.ExternalAssembly/Controls.Xaml.UnitTests.ExternalAssembly.csproj
./src/Controls/tests/Xaml.UnitTests.InternalsVisibleAssembly/Controls.Xaml.UnitTests.InternalsVisibleAssembly.csproj
./src/Controls/tests/Core.UnitTests/Controls.Core.UnitTests.csproj
./src/Controls/tests/Core.Design.UnitTests/Controls.Core.Design.UnitTests.csproj
./src/Controls/tests/Xaml.UnitTests/Controls.Xaml.UnitTests.csproj
./src/Controls/tests/Xaml.UnitTests.InternalsHiddenAssembly/Controls.Xaml.UnitTests.InternalsHiddenAssembly.csproj
"

  csproj=( $(find . -type f -iname "*unittest*.csproj") )
  
  for csp in ${csproj[@]} ; 
  do
    if echo $csp | grep -iqF windows ;
    then
      break
  fi

    echo "--------------------------------------------------------------------------------------------------------------"
    echo $csp  
    dotnet build $csp
  done
}

dev_dotnet_maui_repo_build_ui_tests ()
{
  export PROJECTS=\
"
/src/TestUtils/src/UITest.Core/UITest.Core.csproj
./src/TestUtils/src/UITest.Appium/UITest.Appium.csproj
./src/TestUtils/src/UITest.NUnit/UITest.NUnit.csproj
./src/Compatibility/ControlGallery/test/iOS.UITests/Compatibility.ControlGallery.iOS.UITests.csproj
./src/Compatibility/ControlGallery/test/Xamarin.Forms.Core.macOS.UITests/Xamarin.Forms.Core.macOS.UITests.csproj
./src/Compatibility/ControlGallery/test/Android.UITests/Compatibility.ControlGallery.Android.UITests.csproj
./src/Compatibility/ControlGallery/test/WinUI.UITests/WinUI.UITests.csproj
./src/Controls/samples/Controls.Sample.UITests/Controls.Sample.UITests.csproj
"

  csproj=( $(find . -type f -iname "*uitest*.csproj") )
  
  for csp in ${csproj[@]} ; 
  do
    echo "--------------------------------------------------------------------------------------------------------------"
    echo $csp  
    dotnet build $csp
  done
}

dev_dotnet_maui_repo_build_device_tests ()
{
  export PROJECTS=\
"
/src/TestUtils/src/UITest.Core/UITest.Core.csproj
./src/TestUtils/src/UITest.Appium/UITest.Appium.csproj
./src/TestUtils/src/UITest.NUnit/UITest.NUnit.csproj
./src/Compatibility/ControlGallery/test/iOS.UITests/Compatibility.ControlGallery.iOS.UITests.csproj
./src/Compatibility/ControlGallery/test/Xamarin.Forms.Core.macOS.UITests/Xamarin.Forms.Core.macOS.UITests.csproj
./src/Compatibility/ControlGallery/test/Android.UITests/Compatibility.ControlGallery.Android.UITests.csproj
./src/Compatibility/ControlGallery/test/WinUI.UITests/WinUI.UITests.csproj
./src/Controls/samples/Controls.Sample.UITests/Controls.Sample.UITests.csproj
"

  csproj=( $(find . -type f -iname "*devicetest*.csproj") )
  
  for csp in ${csproj[@]} ; 
  do
    echo "--------------------------------------------------------------------------------------------------------------"
    echo $csp  
    dotnet build $csp
  done
}

dev_dotnet_maui_repo_setup_device_tests ()
{
}

dev_dotnet_maui_fix_installation ()
{
  # Visual Studio for Mac's installer and updater uses dotnet workload install commands to install the 
  # .NET MAUI .pkg files.
  # Since .pkg files can't be uninstalled, the simplest approach to uninstalling the workloads on a Mac 
  # is to run the following commands to delete the specified folders:
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  rm -rf $HOME/.dotnet/
  sudo rm -rf /usr/local/share/dotnet/

  open -na \"Google Chrome\" \
      --args \
      --new-window \
          "https://dotnet.microsoft.com/download" \
          "https://dotnet.microsoft.com/en-us/download/dotnet/8.0" \
          "https://dotnet.microsoft.com/en-us/download/dotnet/7.0" \
          "https://dotnet.microsoft.com/en-us/download/dotnet/6.0" \
          
  "

  rm -rf $HOME/.dotnet/
  sudo rm -rf /usr/local/share/dotnet/

  # -na  - new application
  open -na "Google Chrome" \
      --args \
      --new-window \
          "https://dotnet.microsoft.com/download" \
          "https://dotnet.microsoft.com/en-us/download/dotnet/8.0" \
          "https://dotnet.microsoft.com/en-us/download/dotnet/7.0" \
          "https://dotnet.microsoft.com/en-us/download/dotnet/6.0" \

}

# stop
#       maui
#   dotnet
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   ios
# start

dev_macios_xcode_reset()
{
  # https://learn.microsoft.com/en-us/dotnet/maui/troubleshooting#couldnt-find-a-valid-xcode-app-bundle

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo xcode-select --reset
  "

  sudo xcode-select --reset

}

dev_macios_xcode_install_commandline_tools()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install
  sleep 1
  osascript \
    -e 'tell application "System Events"' \
      -e 'tell process "Install Command Line Developer Tools"' \
        -e 'keystroke return' \
        -e 'click button "Agree" of window "License Agreement"' \
      -e 'end tell' \
    -e 'end tell'
};

dev_ios_simulator_list()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcrun simctl list
  "

  xcrun simctl list
};

export IOS_DEVICE_ID="73FC4795-80E6-4ED9-9BB5-716206BDAFCD"

dev_ios_simulator_launch()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  open -a \
    Simulator \
      --args \
        -CurrentDeviceUDID $IOS_DEVICE_ID
  "

  open -a \
    Simulator \
      --args \
        -CurrentDeviceUDID $IOS_DEVICE_ID

#  /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator \
#    -CurrentDeviceUDID \
#      $DEVICE_ID

# create device using xcrun simctl.
# Boot the simulator with that device
# xcrun simctl install <YOUR-DEVICE-ID> <PATH-TO-APPLICATION-BUNDLE>
# xcrun simctl launch <YOUR-DEVICE-ID> <BUNDLE-ID-OF-APP-BUNDLE>      
};

dev_ios_simulator_reset()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcrun simctl erase all
  "
  xcrun simctl erase all
}

# stop
#   ios
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   tools
#     git
# start

dev_tools_git_clean ()
{
  echo "=============================================================================================================="
  echo \
  "
  git clean -xdf && git status && git pull
  "
  git clean -xdf && git status && git pull
}

dev_tools_git_really_clean()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  git clean -xfd
  git submodule foreach --recursive git clean -xfd
  git submodule update --init --recursive
  "
  git clean -xfd
  git submodule foreach --recursive git clean -xfd
  git submodule update --init --recursive
}

dev_tools_git_prune()
{
  # to clean your local checkout by removing all the branches+tags that no longer exist upstream
  # run this script (or its powershell/cmd equivalent):
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  REMOTES=\"\`git remote\`\"

  git fetch --prune --prune-tags
  git gc --aggressive --prune=now --cruft
  for r in $REMOTES; do
          git remote prune $r
  done
  git worktree prune
  "
  REMOTES="`git remote`"

  git fetch --prune --prune-tags
  git gc --aggressive --prune=now --cruft
  for r in $REMOTES; do
          git remote prune $r
  done
  git worktree prune
}

# stop
#     git
#   tools
# dev   
#======================================================================================================================


#======================================================================================================================
# dev   
#   android
# start

# stop
#   android
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   mac ios
# start

dev_macios_xcode_reset()
{
  # https://learn.microsoft.com/en-us/dotnet/maui/troubleshooting#couldnt-find-a-valid-xcode-app-bundle

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo xcode-select --reset
  "

  sudo xcode-select --reset

}

dev_macios_xcode_install_commandline_tools()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install
  sleep 1
  osascript \
    -e 'tell application "System Events"' \
      -e 'tell process "Install Command Line Developer Tools"' \
        -e 'keystroke return' \
        -e 'click button "Agree" of window "License Agreement"' \
      -e 'end tell' \
    -e 'end tell'
};

dev_ios_simulator_list()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcrun simctl list
  "

  xcrun simctl list
};

export IOS_DEVICE_ID="73FC4795-80E6-4ED9-9BB5-716206BDAFCD"

dev_ios_simulator_launch()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  open -a \
    Simulator \
      --args \
        -CurrentDeviceUDID $IOS_DEVICE_ID
  "

  open -a \
    Simulator \
      --args \
        -CurrentDeviceUDID $IOS_DEVICE_ID

#  /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator \
#    -CurrentDeviceUDID \
#      $DEVICE_ID

# create device using xcrun simctl.
# Boot the simulator with that device
# xcrun simctl install <YOUR-DEVICE-ID> <PATH-TO-APPLICATION-BUNDLE>
# xcrun simctl launch <YOUR-DEVICE-ID> <BUNDLE-ID-OF-APP-BUNDLE>      
};

# stop
#   mac ios
# dev   
#======================================================================================================================

#======================================================================================================================
# work   
#   dotnet
# start

# stop
#   dotnet
# work   
#======================================================================================================================

#----------------------------------------------------------------------------------------------------------------------
# Open Firefox moljac/holisticware

# if firefox is opened this will open additonal tabs

work_moljac()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/firefox-moljac.sh 
  "
  source $HOME/bat.private/mac/firefox-moljac.sh 
};


open_browser_firefox_moljac()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/firefox-moljac.sh
  "
  source $HOME/bat.private/mac/firefox-moljac.sh
};

open_browser_edge_moljac_microsoft()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/edge-moljac-microsoft.sh
  "
  source $HOME/bat.private/mac/edge-moljac-microsoft.sh
};

open_browser_edge_beta_moljac_microsoft()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/edge-beta-moljac-holisticware.sh
  "
  source $HOME/bat.private/mac/edge-beta-moljac-holisticware.sh
};

open_browser_edge_dev_moljac_microsoft()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/edge-dev-moljac-holisticware.sh
  "
  source $HOME/bat.private/mac/edge-dev-moljac-holisticware.sh
};

open_finder_code_moljac_microsoft()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/finder-code-moljac-microsoft.sh
  "
  source $HOME/bat.private/mac/finder-code-moljac-microsoft.sh
};

work_on_docs()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/03-productivity/mac/finder-code-notes-docs.sh
  source $HOME/bat.private/mac/finder-code-term-moljac-microsoft.sh  
  "
  source $HOME/bat/03-productivity/mac/finder-code-notes-docs.sh
  source $HOME/bat.private/mac/finder-code-term-moljac-microsoft.sh  
};

work_on_maui()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/finder-code-term-maui.sh
  "
  source $HOME/bat.private/finder-code-term-maui.sh
};

work_on_ax_gps_fb_mlkit()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/finder-code-term-xamarin-ax-gps-fb-mlkit.sh
  "
  source $HOME/bat.private/finder-code-term-xamarin-ax-gps-fb-mlkit.sh
};

work_on_ph4ct3x()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/finder-code-term-ph4ct3x.sh
  "
  source $HOME/bat.private/finder-code-term-ph4ct3x.sh
};

work_on_moljac_microsoft()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/finder-code-term-moljac-microsoft.sh
  "
  source $HOME/bat.private/finder-code-term-moljac-microsoft.sh
};

work_on_moljac_holisticware()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/finder-code-term-moljac-microsoft.sh
  source $HOME/bat.private/mchwn/firefox-moljac.sh
  source $HOME/bat.private/mchwc/firefox-moljac.sh
  "
  source $HOME/bat.private/finder-code-term-moljac-microsoft.sh
  source $HOME/bat.private/mchwn/firefox-moljac.sh
  source $HOME/bat.private/mchwc/firefox-moljac.sh
};

work_on_moljac()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  work_on_moljac_microsoft
  work_on_moljac_holisticware
  "
  work_on_moljac_microsoft
  work_on_moljac_holisticware
};


#======================================================================================================================
# work   
#   dotnet
# start

# stop
#   dotnet
# work   
#======================================================================================================================


#======================================================================================================================
# work   
#   dotnet
#       android
# start

# stop
#       android
#   dotnet
# work   
#======================================================================================================================

#======================================================================================================================
# work   
#   dotnet
#       maui
# start

# stop
#       maui
#   dotnet
# work   
#======================================================================================================================

#======================================================================================================================
# work   
#   dotnet
#       aspire
# start

# stop
#       aspire
#   dotnet
# work   
#======================================================================================================================


#======================================================================================================================
#----------------------------------------------------------------------------------------------------------------------
echo "PATH                = " $PATH
echo "JAVA_HOME           = " $JAVA_HOME
echo "ANDROID_SDK_ROOT    = " $ANDROID_SDK_ROOT
echo "ANDROID_HOME        = " $ANDROID_HOME
echo "ANDROID_NDK_HOME    = " $ANDROID_NDK_HOME
echo "AndroidSdkDirectory = " $AndroidSdkDirectory
#----------------------------------------------------------------------------------------------------------------------
#======================================================================================================================

eval "$(/opt/homebrew/bin/brew shellenv)"

sys_zsh_functions_list
sys_zsh_functions_load
