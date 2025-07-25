# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
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

# amazon-corretto-8.jdk
# jdk-23.jdk
# microsoft-11.jdk
# microsoft-17.jdk
# microsoft-21.jdk
# temurin-11.jdk
# temurin-17.jdk
# temurin-23.jdk
# temurin-8.jdk
# zulu-11.jdk
# zulu-17.jdk
# zulu-8.jdk

export JAVA_HOME_AMAZON_CORRETO_8=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_OEPNJDK_8=/Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home
export JAVA_HOME_TEMURIN_8=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home
export JAVA_HOME_TEMURIN_11=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
export JAVA_HOME_TEMURIN_17=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export JAVA_HOME_TEMURIN_23=/Library/Java/JavaVirtualMachines/temurin-23.jdk/Contents/Home
export JAVA_HOME_ZULU_8=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_ZULU_11=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export JAVA_HOME_ZULU_17=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export JAVA_HOME_MICROSOFT_11=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home
export JAVA_HOME_MICROSOFT_17=/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home
export JAVA_HOME_MICROSOFT_21=/Library/Java/JavaVirtualMachines/microsoft-21.jdk/Contents/Home
export JAVA_HOME_8=$JAVA_HOME_AMAZON_CORRETO_8
export JAVA_HOME_11=$JAVA_HOME_MICROSOFT_11
export JAVA_HOME_17=$JAVA_HOME_MICROSOFT_17
export JAVA_HOME_21=$JAVA_HOME_MICROSOFT_21
export JAVA_HOME_23=$JAVA_HOME_TEMURIN_23

export JAVA_HOME_ANDROID_STUDIO=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
# export JAVA_HOME_MICROSOFT=$HOME/Library/Developer/Xamarin/jdk/microsoft_dist_openjdk_1.8.0.25
export JAVA_HOME_MICROSOFT=$JAVA_HOME_11

export JAVA_HOME=$JAVA_HOME_MICROSOFT
#----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------
# https://developer.android.com/tools/variables
# ANDROID_HOME
# ANDROID_SDK_ROOT
# installed with Visual Studio (Xamarin)
export ANDROID_HOME_XAMARIN=$HOME/Library/Developer/Xamarin/android-sdk-macosx/
export ANDROID_NDK_HOME_XAMARIN=/usr/local/bin/
export ANDROID_NDK_HOME_BREW="/opt/homebrew/share/android-ndk"

# installed with Android Studio
export ANDROID_HOME_ANDROID_STUDIO=$HOME/Library/Android/sdk/
# installed with brew
export ANDROID_HOME_BREW=/usr/local/share/android-sdk/

export ANDROID_HOME=$ANDROID_HOME_ANDROID_STUDIO
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_NDK_HOME=$ANDROID_NDK_HOME_XAMARIN
export AndroidSdkDirectory=$ANDROID_HOME
export ANDROID_USER_HOME=$HOME/.android/
export ANDROID_AVD_HOME=$ANDROID_USER_HOME/avd/
export ANDROID_EMULATOR_HOME=$ANDROID_USER_HOME

export ANDROID_PATH_CUMULATIVE=$PATH:$ANDROID_HOME/tools/:$ANDROID_HOME/tools/bin/:$ANDROID_HOME/platform-tools/
#----------------------------------------------------------------------------------------------------------------------
export MONO_GAC_PREFIX="/opt/homebrew"
#----------------------------------------------------------------------------------------------------------------------
export EDITOR="code"
export HOMEBREW_EDITOR="/opt/homebrew/bin/code"

# export MSBUILDDISABLENODEREUSE=1
#----------------------------------------------------------------------------------------------------------------------
# https://developer.android.com/tools/variables#set

export PATH=/opt/homebrew/bin/:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/bin/:/opt/homebrew/sbin/
export PATH=/usr/local/bin/:/usr/local/sbin/:
export PATH=$PATH:/usr/bin/:/bin/:/usr/sbin/:/sbin/
export PATH=$PATH:/usr/local/share/dotnet:$HOME/.dotnet/tools/
export PATH=$PATH:/usr/local/bin/pwsh/
# https://www.mono-project.com/docs/about-mono/supported-platforms/macos/
export PATH=$PATH:/Library/Frameworks/Mono.framework/Versions/Current/bin
export PATH=/opt/homebrew/bin/:/opt/homebrew/sbin/:$PATH
export PATH=$PATH:$ANDROID_HOME/bin/
export PATH=$PATH:$ANDROID_HOME/tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/platform-tool/
export PATH=$PATH:$ANDROID_HOME/platform-tools/
# ANDROID_PATH_CUMULATIVE
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_HOME/bundle-tool/
export PATH=$PATH:$ANDROID_SDK_ROOT/
export PATH=$PATH:$JAVA_HOME/
export PATH=$PATH:$JAVA_HOME/bin/
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin":$PATH
#----------------------------------------------------------------------------------------------------------------------
export PATH=$HOME/.dotnet/tools/:$PATH
#######################################################################################################################
export ROOT_NOTES=/Users/Shared/Projects/d/hw/HolisticWare.WebSite.Notes/


#######################################################################################################################
alias ll='ls -al'
alias md='mkdir -p'

alias vs="open -a Visual\ Studio\ \(Preview\)"
alias vsc="code -n ."
alias codeh="code -n ."
alias codi="code-insiders"
alias bode="open -na Brackets"
alias brackets="open -na Brackets"

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
#   start
cdh()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  cd here
  cd $(pwd)
  "
  cd $(pwd)
}

mdr()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  create directory recursively
  mkdir -p $1
  "
  mkdir -p $1
}

sys_energy_low()
{
  # https://commons.lbl.gov/display/itfaq/The+different+types+of+computer+names+for+Mac+computers
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  sudo pmset -a lowpower 1
  sudo pmset -a lowpowermode 1
  blueutil -p 0
  networksetup -setairportpower en0 off
  networksetup -setnetworkserviceenabled Wi-Fi off

  for i in $(seq 1 10);
  do
    osascript -e 'tell application "System Events"' -e 'key code 145' -e ' end tell'
  done
}

sys_energy_high()
{
  # https://github.com/guarinogabriel/Mac-CLI
  # https://commons.lbl.gov/display/itfaq/The+different+types+of+computer+names+for+Mac+computers
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  sudo pmset -a lowpower 0
  sudo pmset -a lowpowermode 0
  blueutil -p 1
  networksetup -setairportpower en0 on
  networksetup -setnetworkserviceenabled Wi-Fi on

  for i in $(seq 1 10);
  do
    osascript -e 'tell application "System Events"' -e 'key code 144' -e ' end tell'
  done
}

sys_name()
{
  # https://commons.lbl.gov/display/itfaq/The+different+types+of+computer+names+for+Mac+computers
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  scutil --get LocalHostName
  scutil --get ComputerName
  scutil --get HostName
  hostname
  "

  scutil --get LocalHostName
  scutil --get ComputerName
  scutil --get HostName
  hostname
}

sys_box_name()
{
  echo \
  "
  export BOXNAME=$(scutil --get LocalHostName)
  case $BOXNAME in
    Miljenkos-MacBook-Pro-16-2023-ARM-M2)  
      echo Miljenkos-MacBook-Pro-16-2023-ARM-M2
      ;;
    Miljenkos-MacBook-Pro-16-2019-x64)  
      echo Miljenkos-MacBook-Pro-16-2019-x64
      ;;
    *)    
      echo Unknown box
      ;;
  esac  
  "

  export BOXNAME=$(scutil --get LocalHostName)
  case $BOXNAME in
    Miljenkos-MacBook-Pro-16-2023-ARM-M2)  
      echo Miljenkos-MacBook-Pro-16-2023-ARM-M2
      ;;
    Miljenkos-MacBook-Pro-16-2019-x64)  
      echo Miljenkos-MacBook-Pro-16-2019-x64
      ;;
    *)    
      echo Unknown box
      ;;
  esac  
}

sys_mount()
{
  diskutil list
  diskutil mount /dev/disk6 /Volumes/xFAT-1TB-2
  diskutil mountDisk /dev/disk6
  mount -t /dev/disk6
  mount force -t /dev/disk6
  diskutil verifyDisk /dev/disk6
  diskutil repairDisk /dev/disk6
  diskutil repairDisk /dev/disk6
}

sys_dock_reset()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/03-productivity/mac/dock-reset-applications.sh
  "
  source $HOME/bat/03-productivity/mac/dock-reset-applications.sh
}

sys_dock_setup()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/03-productivity/mac/dock-setup-applications.sh
  "
  source $HOME/bat/03-productivity/mac/dock-setup-applications.sh
}

sys_postinstall()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sys_term_fingerprint
  sys_brew_clean_update
  dev_macios_xcode_license_accept
  dev_dotnet_workload_reinstall
  dev_dotnet_new_templates_reinstall
  dev_dotnet_tools_reinstall
  dev_dotnet_tools_reinstall_api_tools
  "
  # Agreeing to the Xcode/iOS license requires admin privileges, please run “sudo xcodebuild -license” and then retry 
  # this command.
  sys_term_fingerprint
  sys_brew_clean_update
  dev_macios_xcode_license_accept
  dev_dotnet_workload_reinstall
  dev_dotnet_new_templates_reinstall
  dev_dotnet_tools_reinstall
  dev_dotnet_tools_reinstall_api_tools

  echo \
  "
  sys_term_fingerprint
  sys_brew_clean_update
  dev_macios_xcode_license_accept
  dev_dotnet_workload_reinstall
  dev_dotnet_new_templates_reinstall
  dev_dotnet_tools_reinstall
  dev_dotnet_tools_reinstall_api_tools
  "

}

sys_clean()
{
  source $HOME/bat/01-system-integration/mac/clean.sh

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/clean.sh
  "
  source $HOME/bat/01-system-integration/mac/clean.sh
}

sys_clean_diverse()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
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
  "
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

sys_mode_light ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
  "
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
  # osascript -e 'tell app "System Events" to tell appearance preferences to set

  # defaults write -g NSRequiresAquaSystemAppearance -bool true
  # defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

}

sys_usbd_sd_card_restart ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo launchctl stop com.apple.usbd
  sudo launchctl start com.apple.usbd
  diskutil list 
  "
  sudo launchctl stop com.apple.usbd
  sudo launchctl start com.apple.usbd
  diskutil list
  diskutil verifyVolume /Volumes/xFAT-1TB-2/
}

#   stop
# sys
#######################################################################################################################

#######################################################################################################################
# sys
#   info
# start
function sys_info ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export TIMESTAMP=$(date +%Y-%m-%dT%H-%M-%S)
  export BOX_NAME=sys_box_name

  system_profiler SPHardwareDataType        >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log
  sysctl machdep.cpu.brand_string           >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log
  sysctl -a | grep cpu                      >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log
  sysctl hw.memsize                         >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log

  ioreg -l | grep IOPlatformSerialNumber    >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log
  sw_vers -buildVersion                     >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log

  system_profiler -detailLevel basic        >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.system_profiler-basic.log
  system_profiler -xml                      >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.system_profiler.xml
  "
  export TIMESTAMP=$(date +%Y-%m-%dT%H-%M-%S)
  export BOX_NAME=sys_box_name

  system_profiler SPHardwareDataType        >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log
  sysctl machdep.cpu.brand_string           >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log
  sysctl -a | grep cpu                      >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log
  sysctl hw.memsize                         >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log

  ioreg -l | grep IOPlatformSerialNumber    >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log
  sw_vers -buildVersion                     >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.log

  system_profiler -detailLevel basic        >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.system_profiler-basic.log
  system_profiler -xml                      >> $HOME/Downloads/info-$BOXNAME-$TIMESTAMP.system_profiler.xml

}
# start
#   info
# sys
#######################################################################################################################


#######################################################################################################################
# sys
#   apps
# start

sys_apps_discord_reset ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  rm -fr "$HOME/Library/Application Support/discord/"
  rm -fr "$HOME/Library/Caches/com.hnc.Discord/"
  rm -fr "$HOME/Library/Caches/com.hnc.Discord.ShipIt/"
  "
  rm -fr "$HOME/Library/Application Support/discord/"
  rm -fr "$HOME/Library/Caches/com.hnc.Discord/"
  rm -fr "$HOME/Library/Caches/com.hnc.Discord.ShipIt/"
}

sys_apps_Browserosaurus_kill ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  kill -9 $(ps aux | grep Browserosaurus | grep -v grep | awk '{print $2}')
  "
  kill -9 $(ps aux | grep Browserosaurus | grep -v grep | awk '{print $2}')
}

sys_apps_browsers_edge_reinstall ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/02-install/download/brew-01-install-02-dev-web-browsers-edge.sh
  "

  source $HOME/bat/01-system-integration/mac/02-install/download/brew-01-install-02-dev-web-browsers-edge.sh
}

# stop
#   apps
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

function pkill()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  if [[ $# -eq 0 ]]; 
  then
    kill -9 $(ps aux | grep Browserosaurus | grep -v grep | awk '{print $2}')
  else
    for X in `ps acx | grep -i $1 | awk {'print $1'}`; 
    do
      kill $X;
    done  
  fi
  "
  if [[ $# -eq 0 ]]; 
  then
    ARG=Browserosaurus
    kill -9 $(ps aux | grep $ARG | grep -v grep | awk '{print $2}')
  else
    ARG=$1
    for X in `ps acx | grep -i $ARG | awk {'print $ARG'}`; 
    do
      echo $X
      # kill $X;
    done  
  fi
}
# creates a new terminal window
function term() 
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  if [[ $# -eq 0 ]]; 
  then
      open -a "Terminal" "$PWD"
  else
      open -a "Terminal" "$@"
  fi
  "
  if [[ $# -eq 0 ]]; 
  then
      open -a "Terminal" "$PWD"
  else
      open -a "Terminal" "$@"
  fi
}

function sys_term_tab_completion_reset()
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

  brew update-reset && brew update

  brew doctor
  brew upgrade
  brew upgrade --cask

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

    brew update-reset && brew update

    brew doctor
    brew upgrade
    brew upgrade --cask

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

sys_network_wifi_name()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  system_profiler SPAirPortDataType \\
  | \\
  awk '/Current Network Information:/ { getline; print substr($0, 13, (length($0) - 13)); exit }'

  system_profiler SPAirPortDataType \\
  | \\
  awk -F':' '/Current Network Information:/ {
      getline
      sub(/^ */, "")
      sub(/:$/, "")
      print
  }'  
  "
  
  system_profiler SPAirPortDataType \
  | \
  awk '/Current Network Information:/ { getline; print substr($0, 13, (length($0) - 13)); exit }'

  system_profiler SPAirPortDataType \
  | \
  awk -F':' '/Current Network Information:/ {
      getline
      sub(/^ */, "")
      sub(/:$/, "")
      print
  }'  

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
#   start

dev_info_dump_long()
{
  echo "=============================================================================================================="
  echo \
  "
  dev_dotnet_info_dump 
  dev_android_info_dump
  dev_macios_info_dump
  "
  dev_dotnet_info_dump 
  dev_android_info_dump
  dev_macios_info_dump
}

#   stop
# dev   
#======================================================================================================================


#======================================================================================================================
# dev   
#   jdk
# start

dev_jdks_list()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  java --version
  "
  java --version
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  /usr/libexec/java_home
  "
  /usr/libexec/java_home
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  /usr/libexec/java_home -V
  "
  /usr/libexec/java_home -V
}

dev_jdks_set()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export version=$1
  version=$1
  unset JAVA_HOME;
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
  "
  export version=$1
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
#   profiling speedscope
# start

dev_profiling_speedscope()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  open -na "Microsoft Edge Beta" \\
    $HOME/bin/speedscope/index.html}
  "
  open -na "Microsoft Edge Beta" \
    $HOME/bin/speedscope/index.html
}

# stop
#   profiling speedscope
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   java
# start

dev_java_jdk_8()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export JAVA_HOME=$JAVA_HOME_8
  "
  export JAVA_HOME=$JAVA_HOME_8
}

dev_java_jdk_11()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export JAVA_HOME=$JAVA_HOME_11
  "
  export JAVA_HOME=$JAVA_HOME_11

  echo JAVA_HOME=$JAVA_HOME
}

dev_java_jdk_17()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export JAVA_HOME=$JAVA_HOME_17
  "
  export JAVA_HOME=$JAVA_HOME_17

  echo JAVA_HOME=$JAVA_HOME
}


dev_java_jdk_21()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export JAVA_HOME=$JAVA_HOME_21
  "
  export JAVA_HOME=$JAVA_HOME_21

  echo JAVA_HOME=$JAVA_HOME
}

# stop
#   profiling speedscope
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

dev_android_install_commandline_tools()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
  rm -fr $HOME/Downloads/Android/
  mkdir $HOME/Downloads/Android/
  curl \
    -v -L -C - \
    --output $HOME/Downloads/Android/commandlinetools.zip \
    -O https://dl.google.com/android/repository/commandlinetools-mac-13114758_latest.zip

  unzip \
    $HOME/Downloads/Android/commandlinetools.zip \
    -d $HOME/Downloads/Android/sdk/

  export JAVA_HOME=$JAVA_HOME_MICROSOFT_21
  $HOME/Downloads/Android/sdk/cmdline-tools/bin/sdkmanager \
      --sdk_root=$ANDROID_HOME \
      --install \
        "cmdline-tools;latest" \
        "cmdline-tools;13.0" \
        "cmdline-tools;12.0" \

  sdkmanager \
    "platform-tools" \
    "platforms;android-34" \
    "platforms;android-35" \

}

dev_android_sdkmanager()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export JAVA_HOME=$JAVA_HOME_17

  sdkmanager \
      --update

  sdkmanager \
      --install \
          \"cmdline-tools;latest\"

  sdkmanager \
      --licenses
  "

  sdkmanager --install "cmdline-tools;latest"
  # java 8 is required
  export JAVA_HOME=$JAVA_HOME_17

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

  export JAVA_HOME=$JAVA_HOME_17
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

  sudo rm -fr $($HOME/.android/avd/emulator-android-34-google-apis-arm-v8a-Tablet.avd/*.img)
  sudo rm -fr $($HOME/.android/avd/emulator-android-34-google-apis-arm-v8a-pixel.avd/*.img) 
  sudo rm -fr $($HOME/.android/avd/emulator-android-34-google-apis-arm-v8a-pixel_c.avd/*.img)
  sudo rm -fr $($HOME/.android/avd/emulator-android-34-google-apis-arm-v8a-pixel_xl.avd/*.img) 
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


dev_android_emulators_avdmanager_list_avd()
{
  source $HOME/bat/01-system-integration/mac/02-install/mobile/android/avdmanager-list-avd.sh
}

dev_android_emulators_install()
{
  echo \
  "
  source $HOME/bat/01-system-integration/mac/02-install/mobile/android/emulators-install.sh
  "
  source $HOME/bat/01-system-integration/mac/02-install/mobile/android/emulators-install.sh
}

dev_android_emulators_uninstall()
{
  echo \
  "
  source $HOME/bat/01-system-integration/mac/02-install/mobile/android/emulators-uninstall.sh
  "
  source $HOME/bat/01-system-integration/mac/02-install/mobile/android/emulators-uninstall.sh  
}

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
  adb bugreport
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
  adb shell ls /bugreports/
  adb pull /bugreports/
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



# stop
#   ios
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   devbox
# start
dev_devbox_browser()
{
  echo "=============================================================================================================="
  echo \
  "
  open https://devbox.microsoft.com/
  "

  open https://devbox.microsoft.com/
}

dev_devbox_remote_desktop_connection()
{
  echo "=============================================================================================================="
  echo \
  "
  open -a "Microsoft Remote Desktop"
  "

  open -a "Microsoft Remote Desktop"
}

# stop
#   devbox
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   dotnet
# start

dev_dotnet_installation_nuke()
{
  echo "=============================================================================================================="
  echo \
  "
  START executing:
  source $HOME/bat/01-system-integration/mac/dotnet/nuke.sh
  "

  source $HOME/bat/01-system-integration/mac/dotnet/nuke.sh

  echo "=============================================================================================================="
  echo \
  "
  STOP executing:
  source $HOME/bat/01-system-integration/mac/dotnet/nuke.sh
  "
}

dev_dotnet_installation_nuke_previews()
{
  echo "=============================================================================================================="
  echo \
  "
  dotnet --list-sdks
  dotnet --list-runtimes

  sudo rm -fr $(find /usr/local/share/dotnet/sdk -iname "*-preview*" -o -iname "*-rc*")
  sudo rm -fr $(find /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App -iname "*-preview*" -o -iname "*-rc*")
  sudo rm -fr $(find /usr/local/share/dotnet/shared/Microsoft.NETCore.App -iname "*-preview*" -o -iname "*-rc*")

  dotnet --list-sdks
  dotnet --list-runtimes

  dev_dotnet_workload_reinstall
  dev_dotnet_workload_list
  "
  dotnet --list-sdks
  dotnet --list-runtimes

  sudo rm -fr $(find /usr/local/share/dotnet/sdk -iname "*-preview*" -o -iname "*-rc*")
  sudo rm -fr $(find /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App -iname "*-preview*" -o -iname "*-rc*")
  sudo rm -fr $(find /usr/local/share/dotnet/shared/Microsoft.NETCore.App -iname "*-preview*" -o -iname "*-rc*")

  dotnet --list-sdks
  dotnet --list-runtimes

  dev_dotnet_workload_reinstall
  dev_dotnet_workload_list

  echo \
  "
  dotnet --list-sdks
  dotnet --list-runtimes

  sudo rm -fr $(find /usr/local/share/dotnet/sdk -iname "*-preview*" -o -iname "*-rc*")
  sudo rm -fr $(find /usr/local/share/dotnet/shared/Microsoft.AspNetCore.App -iname "*-preview*" -o -iname "*-rc*")
  sudo rm -fr $(find /usr/local/share/dotnet/shared/Microsoft.NETCore.App -iname "*-preview*" -o -iname "*-rc*")

  dotnet --list-sdks
  dotnet --list-runtimes

  dev_dotnet_workload_reinstall
  dev_dotnet_workload_list
  "
}

dev_dotnet_installation_install_preview()
{
  echo "=============================================================================================================="
  echo \
  "
  if [[ $\(uname -m\) == 'arm64' ]];
  then
    echo MBP M1/M2/M3
    export FILE_DOTNET_PKG=https://download.visualstudio.microsoft.com/download/pr/ca8378e2-a2b8-4dc9-b54b-206feeff5ec5/22fdb7f35fab91ba799ea05bcae84742/dotnet-sdk-8.0.201-osx-arm64.pkg
  else
    echo MBP intel
    export FILE_DOTNET_PKG=https://download.visualstudio.microsoft.com/download/pr/9508dade-753c-45eb-8220-216e8b552548/a5fc65c2b7ef2df9dfa003fbeac44f9f/dotnet-sdk-8.0.201-osx-x64.pkg
  fi

  dotnet --list-sdks
  dotnet --list-runtimes

  cd $HOME/Downloads/
  curl \\
    -v -L -C - \\
    -o dotnet-sdk-downloaded.pkg \\
    -O \\
      $FILE_DOTNET_PKG

  sudo installer \\
    -pkg $HOME/Downloads/dotnet-sdk-downloaded.pkg \\
    -target /  
  rm -f dotnet-sdk-*.pkg
  cd -

  dotnet --list-sdks
  dotnet --list-runtimes

  dev_dotnet_workload_reinstall
  dev_dotnet_workload_list
  "
  if [[ $(uname -m) == 'arm64' ]];
  then
    echo MBP M1/M2/M3
    export FILE_DOTNET_PKG=https://download.visualstudio.microsoft.com/download/pr/ca8378e2-a2b8-4dc9-b54b-206feeff5ec5/22fdb7f35fab91ba799ea05bcae84742/dotnet-sdk-8.0.201-osx-arm64.pkg
  else
    echo MBP intel
    export FILE_DOTNET_PKG=https://download.visualstudio.microsoft.com/download/pr/9508dade-753c-45eb-8220-216e8b552548/a5fc65c2b7ef2df9dfa003fbeac44f9f/dotnet-sdk-8.0.201-osx-x64.pkg
  fi


  dotnet --list-sdks
  dotnet --list-runtimes

  cd $HOME/Downloads/
  curl \
    -v -L -C - \
    -o dotnet-sdk-downloaded.pkg \
    -O \
      $FILE_DOTNET_PKG

  sudo installer \
    -pkg $HOME/Downloads/dotnet-sdk-downloaded.pkg \
    -target /  
  rm -f dotnet-sdk-*.pkg
  cd -

  dotnet --list-sdks
  dotnet --list-runtimes

  dev_dotnet_workload_reinstall
}

dev_dotnet_installation_uninstall()
{
  echo "=============================================================================================================="
  echo \
  "
  START executing:
  source $HOME/bat/01-system-integration/mac/dotnet/9.0/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/8.0/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/6.0/uninstall.sh
  "

  source $HOME/bat/01-system-integration/mac/dotnet/9.0/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/8.0/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/6.0/uninstall.sh

  echo "=============================================================================================================="
  echo \
  "
  STOP executing:
  source $HOME/bat/01-system-integration/mac/dotnet/9.0/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/8.0/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/6.0/uninstall.sh
  "
}

dev_dotnet_installation_download_packages()
{
  echo "=============================================================================================================="
  echo \
  "
  START executing:
  source $HOME/bat/01-system-integration/mac/dotnet/9.0/download.sh
  source $HOME/bat/01-system-integration/mac/dotnet/8.0/download.sh
  source $HOME/bat/01-system-integration/mac/dotnet/6.0/download.sh
  "

  source $HOME/bat/01-system-integration/mac/dotnet/9.0/download.sh
  source $HOME/bat/01-system-integration/mac/dotnet/8.0/download.sh
  source $HOME/bat/01-system-integration/mac/dotnet/6.0/download.sh

  echo "=============================================================================================================="
  echo \
  "
  STOP executing:
  source $HOME/bat/01-system-integration/mac/dotnet/9.0/download.sh
  source $HOME/bat/01-system-integration/mac/dotnet/8.0/download.sh
  source $HOME/bat/01-system-integration/mac/dotnet/6.0/download.sh
  "
}

dev_dotnet_installation_test()
{
  echo "=============================================================================================================="
  echo \
  "
  START executing:
  source $HOME/bat/01-system-integration/mac/dotnet/test.sh
  "

  source $HOME/bat/01-system-integration/mac/dotnet/test.sh

  echo "=============================================================================================================="
  echo \
  "
  STOP executing:
  source $HOME/bat/01-system-integration/mac/dotnet/test.sh
  "
}

dev_dotnet_build_server_shutdown()
{
  echo "=============================================================================================================="
  echo \
  "
  dotnet build-server shutdown \
    --msbuild
  dotnet build-server shutdown \
    --razor
  "
  dotnet build-server shutdown \
    --msbuild
  dotnet build-server shutdown \
    --razor
}


dev_dotnet_build_brute_csproj()
{ 
  echo "=============================================================================================================="
  echo \
  "
  find . -type f -iname "*.csproj" -exec dotnet build \{\} \\;
  "
  find . -type f -iname "*.csproj" -exec dotnet build {} \;
}

dev_dotnet_folders_nuke()
{ 
  echo "=============================================================================================================="
  echo \
  "
  rm -fr\ $\(find . -type d -iname "bin" -o -iname "obj" -o -iname ".meteor" -o -iname ".idea" -o -iname ".vs" \)
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
  dev_dotnet_workload_list
  "  
  dev_dotnet_workload_list
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

  dev_dotnet_sdk_check
}

dev_dotnet_sdk_check()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet sdk check
  "
  dotnet sdk check
}

dev_dotnet_workload_maui_install()
{
  # https://github.com/dotnet/maui/wiki
  # https://github.com/dotnet/maui/wiki/Release-Versions
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet workload install \\
    maui \\
      --source https://api.nuget.org/v3/index.json
  "
  dotnet workload install \
    maui \
      --source https://api.nuget.org/v3/index.json
  echo \
  "
  dotnet workload install \\
    maui \\
      --source https://api.nuget.org/v3/index.json
  "
}
dev_dotnet_workload_list()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet workload list
  dotnet workload list --machine-readable
  dotnet workload update --print-rollback
  "
  dotnet workload list
  dotnet workload list --machine-readable
  dotnet workload update --print-rollback

  echo \
  "
  dotnet workload list
  dotnet workload list --machine-readable
  dotnet workload update --print-rollback
  "
}

dev_dotnet_workload_reinstall()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/dotnet/workload/uninstall-old.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/install.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/config.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/update.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/repair.sh

  dev_dotnet_workload_list
  "
  source $HOME/bat/01-system-integration/mac/dotnet/workload/uninstall-old.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/install.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/config.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/update.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/repair.sh

  dev_dotnet_workload_list

  echo \
  "
  source $HOME/bat/01-system-integration/mac/dotnet/workload/uninstall-old.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/uninstall.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/install.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/config.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/update.sh
  source $HOME/bat/01-system-integration/mac/dotnet/workload/repair.sh

  dev_dotnet_workload_list
  "
};

dev_dotnet_workload_edit()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  code -n $HOME/bat/01-system-integration/mac/dotnet/workload/
  "
  code -n $HOME/bat/01-system-integration/mac/dotnet/workload/
}

dev_dotnet_workload_clean()
{ 
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo dotnet workload clean
  # sudo dotnet workload clean --all
  dev_dotnet_workload_list
  "
  sudo dotnet workload clean
  # sudo dotnet workload clean --all
  dev_dotnet_workload_list
}

dev_dotnet_tools_reinstall()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/01-system-integration/mac/dotnet/tool/install.sh

  dotnet tool \\
    uninstall \\
      Cake.Tool \\
      --global \\

  # installs preview cake
  dotnet tool \\
    install \\
      --global \\
        Cake.Tool \\
        --add-source https://pkgs.dev.azure.com/cake-build/Cake/_packaging/cake/nuget/v3/index.json \\
        --prerelease \\
        --verbosity:diag \\

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

  # installs preview cake
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
  dotnet tool uninstall --global private-api-tools
  dotnet tool install --global private-api-tools --version 1.0.3
  "
  # source $HOME/bat/01-system-integration/mac/dotnet/tool/api-tools-private.sh
  dotnet tool uninstall --global private-api-tools
  dotnet tool install --global private-api-tools --version 1.0.3
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

#---------------------------------------------------------------------
# /Applications/PhpStorm.app/Contents/bin/idea.properties
# $HOME/Library/Application\ Support/JetBrains/Rider2024.2/idea.properties
# echo idea.case.sensitive.fs=true >> /Applications/Rider.app/Contents/bin/idea.properties
#---------------------------------------------------------------------
idea.case.sensitive.fs=true

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
  dotnet cake utilities.cake \\
  && \\
  dotnet cake utilities.cake -t=generate-namespace-file \\
  && \\
  dotnet build tests/extended/ExtendedTests.csproj -c Release \\
  && \\
  dotnet cake nuget-diff.cake -v:diagnostic \\
  "
  dotnet cake -t=ci \
  && \
  dotnet cake utilities.cake \
  && \
  dotnet cake utilities.cake -t=generate-namespace-file \
  && \
  dotnet build tests/extended/ExtendedTests.csproj -c Release \
  && \
  dotnet cake nuget-diff.cake -v:diagnostic \

}

dev_dotnet_android_bindings_binderator_config_update()
{ 
  echo "=============================================================================================================="
  # dotnet script update-config.csx -- ./config.json <update|bump|published|sort>
  echo \
  "
  dotnet cake -t=update-config
  "
  
  # dotnet script ./build/scripts/update-config.csx -- ./config.json update
  dotnet cake -t=update-config

  echo "_______________________________________________________________________________________________________________"
  echo \
  "
  dotnet cake -t=update-config
  DONE
  "
  echo "=============================================================================================================="
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


dev_dotnet_android_repo_build_01()
{
  echo "=============================================================================================================="
  echo \
  "
  "
}

dev_dotnet_android_repo_build_02()
{
  echo "=============================================================================================================="
  echo \
  "
  dotnet build Xamarin.Android.sln -t:Prepare --no-restore --tl:off -bl
  dotnet-local.cmd build Xamarin.Android.sln -t:BuildDotNet --tl:off -bl
  "
  dotnet build Xamarin.Android.sln -t:Prepare --no-restore --tl:off -bl
  dotnet-local.cmd build Xamarin.Android.sln -t:BuildDotNet --tl:off -bl
}

dev_dotnet_android_profiling_setup_emulator()
{
  # https://devblogs.microsoft.com/dotnet/performance-improvements-in-dotnet-maui/#startup-performance-improvements
  echo "=============================================================================================================="
  echo \
  "
  "
  #-------------------------------------------------------------------------------------------------
  adb forward --list
  adb forward --remove-all
  adb reverse --list
  adb reverse --remove-all

  adb forward --list
  adb reverse --list
  adb kill-server
  adb start-server
  #-------------------------------------------------------------------------------------------------
  # Set up reverse port forwarding:
  #     emulator          - skip this step
  #     physical device   - required
  # adb reverse tcp:9000 tcp:9001
  # alternative
  #     allocate a random port on remote and forward it to port 9001 on the host
  #      forwarded port is printed by adb
  # adb reverse tcp:0 tcp:9001
  #-------------------------------------------------------------------------------------------------
  # Configure the device so that the profiled app suspends until tracing utility connects
  adb shell setprop debug.mono.profile '127.0.0.1:9000,suspend'
  #-------------------------------------------------------------------------------------------------
  # profiling on emulator
  dotnet-dsrouter android-emu --verbose debug
  # profiling on device
  # dotnet-dsrouter server-server -tcps 127.0.0.1:9001 --verbose debug
  export PORT=$(dotnet-trace ps | grep dotnet-dsrouter | awk '{ print $1 }')
  echo "PORT = $PORT"
  dotnet-trace collect -p $PORT --format speedscope
}

dev_dotnet_android_profiling_setup_device()
{ 
  # https://devblogs.microsoft.com/dotnet/performance-improvements-in-dotnet-maui/#startup-performance-improvements
  echo "=============================================================================================================="
  echo \
  "
  "
  # Set up reverse port forwarding:
  #     emulator          - skip this step
  #     physical device   - required
  adb reverse tcp:9000 tcp:9001
  # alternative
  #     allocate a random port on remote and forward it to port 9001 on the host
  #      forwarded port is printed by adb
  # adb reverse tcp:0 tcp:9001
  # Configure the device so that the profiled app suspends until tracing utility connects
  adb shell setprop debug.mono.profile '127.0.0.1:9000,suspend'
  # profiling on emulator
  # dotnet-dsrouter android-emu --verbose diagnostic
  # profiling on device
  dotnet-dsrouter server-server -tcps 127.0.0.1:9001 --verbose debug
  dotnet-dsrouter client-server -tcps 127.0.0.1:9001 --verbose debug -ipcc /tmp/maui-app
}

dev_dotnet_android_profiling_profile()
{ 
  # https://devblogs.microsoft.com/dotnet/performance-improvements-in-dotnet-maui/#startup-performance-improvements
  echo "=============================================================================================================="
  echo \
  "
  "
  export PROJECT=./net8.0/ProjectsStructureTemplate.AppMAUI.DemoSample/ProjectsStructureTemplate.AppMAUI.DemoSample.csproj
  dotnet build \
    $PROJECT \
      -f net8.0-android \
      -t:Run \
      -c Release \
      -p:AndroidEnableProfiler=true \
      -p:IsEmulator=true \
      /p:RunAOTCompilation=true 

}

dev_dotnet_android_packages_uninstall()
{
  export PATTERN=com.companyname
  #export PATTERN=com.jsuarezruiz
  export PATTERN=com.microsoft.maui
  for ap in $( adb shell pm list packages | grep "$PATTERN" | awk -F':' '{print $2}' ) ; 
  do
    echo "$ap"
    adb uninstall "$ap"    
  done
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

dev_dotnet_maui_new_demo_repro_multitarget ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  mkdir net8.0
  mkdir net9.0

  dotnet new \
      globaljson \
          --sdk-version 8.0.404 \
          --output net8.0\


  dotnet new \
      globaljson \
          --sdk-version 9.0.100 \
          --output net9.0\

  dotnet new \
      maui \
          --framework net8.0 \
          --output net8.0/AppMAUI

  dotnet new \
      maui \
          --framework net9.0 \
          --output net9.0/AppMAUI

  dotnet new \
      sln \
          --output net8.0/ \
          --name Repro

  dotnet new \
      sln \
          --output net9.0/ \
          --name Repro
  "
  mkdir net8.0
  mkdir net9.0

  dotnet new \
      globaljson \
          --sdk-version 8.0.404 \
          --output net8.0\


  dotnet new \
      globaljson \
          --sdk-version 9.0.100 \
          --output net9.0\

  dotnet new \
      maui \
          --framework net8.0 \
          --output net8.0/AppMAUI

  dotnet new \
      maui \
          --framework net9.0 \
          --output net9.0/AppMAUI

  dotnet new \
      sln \
          --output net8.0/ \
          --name Repro

  dotnet new \
      sln \
          --output net9.0/ \
          --name Repro

}

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
            -f:net9.0-android \
            /p:AndroidSdkDirectory=$ANDROID_HOME
    "

    dotnet \
      watch \
        build \
            $d \
            -t:Run \
            -f:net9.0-android \
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
            -f:net9.0-ios \
            -p:_DeviceName=:v2:udid=$IOS_DEVICE_ID
    "

    dotnet \
      watch \
        build \
          $d \
          -t:Run \
            -f:net9.0-ios \
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

dev_dotnet_maui_android_java ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export JAVA_HOME=$JAVA_HOME_17
  "
  export JAVA_HOME=$JAVA_HOME_17
}

dev_dotnet_maui_repo_build_all ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dev_dotnet_maui_repo_build_visual_studio_code
  dev_dotnet_maui_repo_build_samples
#  dev_dotnet_maui_repo_build_device_tests
  "
  dev_dotnet_maui_repo_build_visual_studio_code
  dev_dotnet_maui_repo_build_samples
  dev_dotnet_maui_repo_build_tests_all_AAAA
#  dev_dotnet_maui_repo_build_tests
#  dev_dotnet_maui_repo_build_device_tests
}

dev_dotnet_maui_repo_build_buildtasks ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  dotnet tool restore
  dotnet cake \
    --target=dotnet-buildtasks \
    --configuration="Release" \
    --workloads=global
  "

  dotnet tool restore
  dotnet cake \
    --target=dotnet-buildtasks \
    --configuration="Release" \
    --workloads=global
}

dev_dotnet_maui_repo_build_samples ()
{
  dotnet tool restore
  dev_dotnet_maui_repo_build_visual_studio_code

  export PROJECTS=\
"
./src/Controls/samples/Controls.Sample/Maui.Controls.Sample.csproj
./src/Controls/samples/Controls.Sample.Sandbox/Maui.Controls.Sample.Sandbox.csproj
./src/Essentials/samples/Samples/Essentials.Sample.csproj 
./src/BlazorWebView/samples/BlazorWinFormsApp/Maui.BlazorWinFormsApp.Sample.csproj
./src/BlazorWebView/samples/BlazorWpfApp/Maui.BlazorWpfApp.Sample.csproj
"

  IFS=$'\n'
  # ZSH does not split words by default (like other shells):
  setopt sh_word_split
  
  for csp in $PROJECTS ; 
  do
    echo "--------------------------------------------------------------------------------------------------------------"
    echo $csp  
    dotnet build $csp
  done
}

dev_dotnet_maui_repo_build_tests_all_AAAA ()
{
  dotnet tool restore
  brew uninstall node
  brew install node
  
  export PROJECTS=\
"
./src/TestUtils/src/UITest.Core/UITest.Core.csproj
./src/TestUtils/src/UITest.Appium/UITest.Appium.csproj
./src/TestUtils/src/UITest.NUnit/UITest.NUnit.csproj
./src/Controls/samples/Controls.Sample.UITests/Controls.Sample.UITests.csproj
./src/Controls/tests/DeviceTests/Controls.DeviceTests.csproj
./src/Controls/tests/TestCases.Shared.Tests/Controls.TestCases.Shared.Tests.csproj
./src/Controls/tests/TestCases.Android.Tests/Controls.TestCases.Android.Tests.csproj
./src/Controls/tests/TestCases.iOS.Tests/Controls.TestCases.iOS.Tests.csproj
./src/Controls/tests/TestCases.Mac.Tests/Controls.TestCases.Mac.Tests.csproj
./src/Controls/tests/TestCases.WinUI.Tests/Controls.TestCases.WinUI.Tests.csproj
./src/Controls/tests/SourceGen.UnitTests/SourceGen.UnitTests.csproj
./src/Controls/tests/Xaml.UnitTests.InternalsHiddenAssembly/Controls.Xaml.UnitTests.InternalsHiddenAssembly.csproj
./src/Controls/Foldable/test/Controls.DualScreen.UnitTests.csproj
./src/Compatibility/Core/tests/Compatibility.UnitTests/Compatibility.Core.UnitTests.csproj
./src/Compatibility/Core/tests/Android/Compatibility.Android.UnitTests.csproj
./src/Compatibility/Core/tests/iOS/Compatibility.iOS.UnitTests.csproj
./src/Compatibility/Core/tests/WinUI/Compatibility.Windows.UnitTests.csproj
./src/Compatibility/ControlGallery/test/Xamarin.Forms.Core.macOS.UITests/Xamarin.Forms.Core.macOS.UITests.csproj
./src/Compatibility/ControlGallery/test/Android.UITests/Compatibility.ControlGallery.Android.UITests.csproj
./src/Compatibility/ControlGallery/test/iOS.UITests/Compatibility.ControlGallery.iOS.UITests.csproj
./src/Compatibility/ControlGallery/test/WinUI.UITests/WinUI.UITests.csproj
./src/SingleProject/Resizetizer/test/UnitTests/Resizetizer.UnitTests.csproj
./src/Essentials/test/UnitTests/Essentials.UnitTests.csproj
./src/Essentials/test/DeviceTests/Essentials.DeviceTests.csproj
./src/Graphics/tests/Graphics.Tests/Graphics.Tests.csproj
./src/Graphics/tests/DeviceTests/Graphics.DeviceTests.csproj
./src/TestUtils/src/DeviceTests/TestUtils.DeviceTests.csproj
./src/TestUtils/samples/DeviceTests.Sample/TestUtils.DeviceTests.Sample.csproj
./src/TestUtils/src/DeviceTests.Runners/TestUtils.DeviceTests.Runners.csproj
./src/TestUtils/src/DeviceTests.Runners.SourceGen/TestUtils.DeviceTests.Runners.SourceGen.csproj
./src/TestUtils/src/Microsoft.Maui.IntegrationTests/Microsoft.Maui.IntegrationTests.csproj
"
  IFS=$'\n'
  # ZSH does not split words by default (like other shells):
  setopt sh_word_split
  
  for csp in $PROJECTS ; 
  do
    echo "--------------------------------------------------------------------------------------------------------------"
    echo $csp  
    dotnet build $csp
  done

  dotnet tool restore
  brew uninstall node
  brew install node
  curl \
    -v -L -C - \
    -o $HOME/Downloads/appium-install.ps \
    -O \
      https://github.com/dotnet/maui/blob/main/eng/scripts/appium-install.ps1?raw=true

  sudo dotnet pwsh $HOME/Downloads/appium-install.ps1
}


dev_dotnet_maui_repo_build_tests ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
./src/Core/tests/UnitTests/Core.UnitTests.csproj
./src/Core/tests/DeviceTests/Core.DeviceTests.csproj
./src/Core/tests/DeviceTests.Shared/Core.DeviceTests.Shared.csproj
./src/BlazorWebView/tests/MauiDeviceTests/MauiBlazorWebView.DeviceTests.csproj
./src/Controls/tests/Core.UnitTests/Controls.Core.UnitTests.csproj
./src/Controls/tests/Core.Design.UnitTests/Controls.Core.Design.UnitTests.csproj
./src/Controls/tests/Xaml.UnitTests/Controls.Xaml.UnitTests.csproj
./src/Controls/tests/Xaml.UnitTests.ExternalAssembly/Controls.Xaml.UnitTests.ExternalAssembly.csproj
./src/Controls/tests/BindingSourceGen.UnitTests/Controls.BindingSourceGen.UnitTests.csproj
./src/Controls/tests/Xaml.UnitTests.InternalsVisibleAssembly/Controls.Xaml.UnitTests.InternalsVisibleAssembly.csproj
  "
  IFS=$'\n'
  # ZSH does not split words by default (like other shells):
  setopt sh_word_split
  
  for csp in $PROJECTS ; 
  do
    echo "--------------------------------------------------------------------------------------------------------------"
    echo $csp  
    dotnet build $csp
  done
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

  dotnet build ./Microsoft.Maui.BuildTasks.slnf      
  dotnet build ./Microsoft.Maui-mac.slnf
  dotnet build ./Microsoft.Maui.Samples.slnf
  dotnet build ./Microsoft.Maui.LegacyControlGallery.slnf /p:EnableWindowsTargeting=true
  dotnet build ./Microsoft.Maui.Packages-mac.slnf
  #  dotnet build ./Microsoft.Maui.Graphics.slnf /p:EnableWindowsTargeting=true
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

dev_dotnet_maui_repo_build_all ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  git clean -xdf ; dev_dotnet_maui_repo_build_visual_studio_code
  git clean -xdf ; dev_dotnet_maui_repo_build_projects
  git clean -xdf ; dev_dotnet_maui_repo_build_device_unit_tests
  git clean -xdf ; dev_dotnet_maui_repo_build_device_ui_tests
  git clean -xdf ; dev_dotnet_maui_repo_build_device_tests
  "
  git clean -xdf ; dev_dotnet_maui_repo_build_visual_studio_code
  git clean -xdf ; dev_dotnet_maui_repo_build_projects
  git clean -xdf ; dev_dotnet_maui_repo_build_device_unit_tests
  git clean -xdf ; dev_dotnet_maui_repo_build_device_ui_tests
  git clean -xdf ; dev_dotnet_maui_repo_build_device_tests
}


# stop
#       maui
#   dotnet
# dev   
#======================================================================================================================

#======================================================================================================================
# dev   
#   dotnet
#       macios
# start

# stop
#       macios
#   dotnet
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
#   macios
# start

dev_macios_xcode_cli_tools ()
{
  xcodebuild -version
  #On versions 10.9 and later (OS X Yosemite to macOS Monterey):
  pkgutil --pkg-info=com.apple.pkg.CLTools_Executables
  # on OS X 10.8 (Mountain Lion):
  pkgutil --pkg-info=com.apple.pkg.DeveloperToolsCLI
  softwareupdate --history
}

# greyed out simulators
dev_macios_xcode_reset ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo xcode-select --reset
  sudo xcode-select -s /Applications/Xcode.app
  sudo xcode-select -switch /Applications/Xcode.app/Contents/Ddeveloper
  sudo xcodebuild -license accept
  sudo xcodebuild -runFirstLaunch
  "
  sudo xcode-select --reset
  sudo xcode-select -s /Applications/Xcode.app
  sudo xcode-select -switch /Applications/Xcode.app/Contents/Ddeveloper
  sudo xcodebuild -license accept
  sudo xcodebuild -runFirstLaunch

}

dev_macios_info_dump()
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

dev_macios_xcode_commandline_tools_reinstall()
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

dev_macios_xcode_commandline_tools_version()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  #On versions 10.9 and later (OS X Yosemite to macOS Monterey):
  pkgutil --pkg-info=com.apple.pkg.CLTools_Executables
  # on OS X 10.8 (Mountain Lion):
  pkgutil --pkg-info=com.apple.pkg.DeveloperToolsCLI
  "
  #On versions 10.9 and later (OS X Yosemite to macOS Monterey):
  pkgutil --pkg-info=com.apple.pkg.CLTools_Executables
  # on OS X 10.8 (Mountain Lion):
  pkgutil --pkg-info=com.apple.pkg.DeveloperToolsCLI
}

dev_macios_xcode_version()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcodebuild -version
  "
  xcodebuild -version
}

dev_macios_softwareupdate_history()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  softwareupdate --history
  "
  softwareupdate --history
}

dev_macios_xcode_xcodebuild_sdks()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcodebuild -showsdks
  "
  xcodebuild -showsdks
}

dev_macios_xcode_xcodebuild_license_accept()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo xcodebuild -license accept
  "
  sudo xcodebuild -license accept
}

dev_macios_xcode_xcodebuild_reset()
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

dev_macios_simulator_list()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcrun simctl list
  "
  xcrun simctl list
};

export IOS_DEVICE_ID="73FC4795-80E6-4ED9-9BB5-716206BDAFCD"

dev_macios_simulator_launch()
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

dev_macios_simulator_reset()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcrun simctl erase all
  "
  xcrun simctl erase all
}

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

# xcodebuild -downloadPlatform <iOS|watchOS|tvOS|visionOS>  [-exportPath <destinationpath> -buildVersion <version>]

dev_macios_xcode_install_simulators()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcode-select -s /Applications/Xcode.app
  xcodebuild -runFirstLaunch
  xcodebuild -downloadAllPlatforms
  xcodebuild -downloadPlatform iOS
  xcodebuild -downloadPlatform tvOS
  xcodebuild -downloadPlatform watchOS
  # xcodebuild -downloadPlatform visionOS
  "
  sudo xcode-select -s /Applications/Xcode.app
  xcodebuild -runFirstLaunch
  xcodebuild -downloadAllPlatforms
  xcodebuild -downloadPlatform iOS
  xcodebuild -downloadPlatform tvOS
  xcodebuild -downloadPlatform watchOS
#  xcodebuild -downloadPlatform visionOS
}

dev_macios_xcode_install_commandline_tools()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install
  sleep 1
  osascript \\
    -e 'tell application "System Events"' \\
      -e 'tell process "Install Command Line Developer Tools"' \\
        -e 'keystroke return' \\
        -e 'click button "Agree" of window "License Agreement"' \\
      -e 'end tell' \\
    -e 'end tell'
  "
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

dev_macios_simulator_list()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  xcrun simctl list
  "
  xcrun simctl list
};

export IOS_DEVICE_ID="73FC4795-80E6-4ED9-9BB5-716206BDAFCD"

dev_macios_simulator_launch()
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
#   macios
# dev   
#======================================================================================================================

#======================================================================================================================
# work   
#   dotnet
# start

work_init()
{
  finder-open-window-with-tabs-09-private.sh
}
work_on_dev_dotnet_api_keys_set ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  work_on_dev_dotnet_api_keys_nuget_set
  work_on_dev_dotnet_api_keys_github_set
  "
  work_on_dev_dotnet_api_keys_nuget_set
  work_on_dev_dotnet_api_keys_github_set

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  env
  env | grep 'API' 
  "
  env
  env | grep 'API' 
}

work_on_dev_dotnet_api_keys_clear ()
{  
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  work_on_dev_dotnet_api_keys_nuget_set
  work_on_dev_dotnet_api_keys_github_set
  "
  work_on_dev_dotnet_api_keys_nuget_set
  work_on_dev_dotnet_api_keys_github_set

  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  env
  "
  env
  
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  env | grep 'API' 
  "
  env | grep 'API' 
}

work_on_dev_dotnet_aspire ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  export ASPIRE_ALLOW_UNSECURED_TRANSPORT=true  
  "
  export ASPIRE_ALLOW_UNSECURED_TRANSPORT=true  
}

work_on_dev_dotnet_api_keys_nuget_set ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/development/api-keys/nuget/set.sh
  "
  source $HOME/bat.private/mac/development/api-keys/nuget/set.sh
}

work_on_dev_dotnet_api_keys_nuget_clear ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/development/api-keys/nuget/clear.sh
  "
  source $HOME/bat.private/mac/development/api-keys/nuget/clear.sh 
}

work_on_dev_dotnet_api_keys_github_set ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/development/api-keys/github/set.sh
  "
  source $HOME/bat.private/mac/development/api-keys/github/set.sh
}

work_on_dev_dotnet_api_keys_github_clear ()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/development/api-keys/github/clear.sh
  "
  source $HOME/bat.private/mac/development/api-keys/github/clear.sh
  
}

# stop
#   dotnet
# work   
#======================================================================================================================

#----------------------------------------------------------------------------------------------------------------------
# Open Firefox moljac/holisticware

# if firefox is opened this will open additonal tabs

# Miljenkos-MacBook-Pro-16-2023-ARM-M2
# Miljenkos-MacBook-Pro-16-2019-x64

open_browser_firefox_moljac()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/mchwc/firefox-moljac.sh
  source $HOME/bat.private/mac/mchwn/firefox-moljac.sh
  "
  source $HOME/bat.private/mac/mchwc/firefox-moljac.sh
  source $HOME/bat.private/mac/mchwn/firefox-moljac.sh
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



work_on_microsoft_dotnet_android_ax_gps_fb_mlkit()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/microsoft/dotnet/android/ax-gps-fb-mlkit/all.sh
  "
  source $HOME/bat.private/mac/microsoft/dotnet/android/ax-gps-fb-mlkit/all.sh
};

work_on_microsoft_dotnet_maui()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/microsoft/dotnet/maui/all.sh
  "
  source $HOME/bat.private/mac/microsoft/dotnet/maui/all.sh
};

work_moljac()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/firefox-moljac.sh 

  code -n $HOME/bat.private/mac/mchwc/firefox-moljac.sh
  code -n $HOME/bat.private/mac/mchwn/firefox-moljac.sh
  source $HOME/bat.private/mac/mchwc/firefox-moljac.sh
  source $HOME/bat.private/mac/mchwn/firefox-moljac.sh
  "
  source $HOME/bat.private/mac/firefox-moljac.sh 

  code -n $HOME/bat.private/mac/mchwc/firefox-moljac.sh
  code -n $HOME/bat.private/mac/mchwn/firefox-moljac.sh
  source $HOME/bat.private/mac/mchwc/firefox-moljac.sh
  source $HOME/bat.private/mac/mchwn/firefox-moljac.sh
};

work_on_microsoft_dotnet_maui_repo()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
};

work_on_microsoft_dotnet_maui_repo()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  "
};

work_on_microsoft_dotnet_maui_learn()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/finder-code-term-maui.sh
  "
  source $HOME/bat.private/finder-code-term-maui.sh
};

work_on_holisticware_core()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  open \\
    https://github.com/AArnott/Library.Template
  "
  open \
    https://github.com/AArnott/Library.Template
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

work_on_moljac_holisticware_doc()
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



work_on_moljac_holisticware_ph4ct3x()
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

work_on_init()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  work_on_main
  work_on_moljac_private
  "
  work_on_main
  work_on_moljac_private
}

work_on_main()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  $HOME/bat/03-productivity/mac/finder-open-window-with-tabs-00-main.sh
  "
  source \
    $HOME/bat/03-productivity/mac/finder-open-window-with-tabs-00-main.sh
};

work_on_moljac_learn()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  work_on_moljac_learn_dotnet_csharp_maui
  work_on_moljac_learn_ai
  work_on_moljac_learn_software_engineering
  "
  work_on_moljac_learn_dotnet_csharp_maui
  work_on_moljac_learn_ai
  work_on_moljac_learn_software_engineering
}

work_on_moljac_learn_dotnet_csharp_maui()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/mchwc/firefox-moljac-learn-dotnet-csharp-maui.sh
  # open -n -a /System/Applications/Utilities/Terminal.app
  open -a Terminal \\
    $ROOT_NOTES/data-structures-and-algorithms/data-science/ai-artificial-intelligence/ \\
    $ROOT_NOTES/data-structures-and-algorithms/ \\
  "
  source $HOME/bat.private/mac/mchwc/firefox-moljac-learn-dotnet-csharp-maui.sh
  # open -n -a /System/Applications/Utilities/Terminal.app
  open -a Terminal \
    $ROOT_NOTES/data-structures-and-algorithms/data-science/ai-artificial-intelligence/ \
    $ROOT_NOTES/data-structures-and-algorithms/ \

}

work_on_moljac_learn_ai()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/mchwc/firefox-moljac-learn-ai.sh
  # open -n -a /System/Applications/Utilities/Terminal.app
  open -a Terminal \\
    $ROOT_NOTES/data-structures-and-algorithms/data-science/ai-artificial-intelligence/ \\
    $ROOT_NOTES/data-structures-and-algorithms/ \\
  "
  source $HOME/bat.private/mac/mchwc/firefox-moljac-learn-ai.sh
  # open -n -a /System/Applications/Utilities/Terminal.app
  open -a Terminal \
    $ROOT_NOTES/data-structures-and-algorithms/data-science/ai-artificial-intelligence/ \
    $ROOT_NOTES/data-structures-and-algorithms/ \

}

work_on_moljac_learn_software_engineering()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/mchwc/firefox-moljac-learn-software-engineering.sh
  # open -n -a /System/Applications/Utilities/Terminal.app
  open -a Terminal \\
    $ROOT_NOTES/data-structures-and-algorithms/data-science/ai-artificial-intelligence/ \\
    $ROOT_NOTES/data-structures-and-algorithms/ \\
  "
  source $HOME/bat.private/mac/mchwc/firefox-moljac-learn-software-engineering.sh
  # open -n -a /System/Applications/Utilities/Terminal.app
  open -a Terminal \
    $ROOT_NOTES/data-structures-and-algorithms/data-science/ai-artificial-intelligence/ \
    $ROOT_NOTES/data-structures-and-algorithms/ \

}

work_on_moljac_private()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  sys_box_name
  echo BOXNAME=$BOXNAME

  source \\
    $HOME/bat/03-productivity/mac/finder-open-new-window.scpt.sh

  source \\
    $HOME/bat/03-productivity/mac/$BOXNAME/finder-window-add-tabs-09-private-e-external.scpt.sh
  source \\
    $HOME/bat.private/03-productivity/mac/$BOXNAME/finder-window-add-tabs-09-private-e-external.scpt.sh
  "
  sys_box_name
  echo BOXNAME=$BOXNAME

  source \
    $HOME/bat/03-productivity/mac/finder-open-new-window.scpt.sh

  source \
    $HOME/bat/03-productivity/mac/$BOXNAME/finder-window-add-tabs-09-private-e-external.scpt.sh
  source \
    $HOME/bat.private/03-productivity/mac/$BOXNAME/finder-window-add-tabs-09-private-e-external.scpt.sh

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

work_on_moljac_judo()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat.private/mac/moljac/judo/all.sh
  "
  source $HOME/bat.private/mac/moljac/judo/all.sh
}

work_on_judo_remove_me()
{
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  source $HOME/bat/03-productivity/mac/finder-open-window-with-tabs-09-private-sport.sh
  term \\
    /Volumes/xFAT-1TB-2/e/personal-private/judo/
  term \\
    /Volumes/xFAT-1TB-2/e/personal-private/judo/HJS/01-pravno/DORH/02-kaznena-prijava-koraci/TODO/mails
  "

  source $HOME/bat/03-productivity/mac/finder-open-window-with-tabs-09-private-sport.sh
  term \
    /Volumes/xFAT-1TB-2/e/personal-private/judo/
  term \
    /Volumes/xFAT-1TB-2/e/personal-private/judo/HJS/01-pravno/DORH/02-kaznena-prijava-koraci/TODO/mails
};


#======================================================================================================================
# work   
#   API Keys
# start

# tree $HOME/bat.private/mac/development/api-keys 
$HOME/bat.private/mac/development/api-keys/

dev_api_keys_set ()
{
  source  $HOME/bat.private/mac/development/api-keys/github/set.sh 
  source  $HOME/bat.private/mac/development/api-keys/nuget/set.sh 

  dev_api_keys_set_ai
}

dev_api_keys_set_ai ()
{
  source  $HOME/bat.private/mac/development/api-keys/ai/anthropic/set.sh 
  # source  $HOME/bat.private/mac/development/api-keys/ai/open-ai/set.sh 
  #source  $HOME/bat.private/mac/development/api-keys/ai/perplexity/set.sh 
  source  $HOME/bat.private/mac/development/api-keys/ai/picovoice/set.sh 

}

dev_api_keys_set_weather ()
{
}

dev_api_keys_clean ()
{  
}

work_on_dev_api_keys ()
{
  open $HOME/bat.private/mac/development/api-keys
  code -n $HOME/bat.private/mac/development/api-keys
  code -n $HOME/.zshrc
}
# stop
#   API Keys
# work   
#======================================================================================================================


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
echo "ANDROID_AVD_HOME    = " $ANDROID_AVD_HOME
tree $ANDROID_AVD_HOME

# export VISUAL="code --wait"
#----------------------------------------------------------------------------------------------------------------------
#======================================================================================================================

eval "$(/opt/homebrew/bin/brew shellenv)"

sys_zsh_functions_list
sys_zsh_functions_load

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/moljac/.lmstudio/bin"
# End of LM Studio CLI section

