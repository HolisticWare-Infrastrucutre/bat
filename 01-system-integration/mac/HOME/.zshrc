setopt PROMPT_SUBST
# PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '
# PROMPT='$fg[cyan]%m:$fg[yellow] %T %B%30<..<%~%b %(!.#.>) '
PROMPT='%F{yellow}%3~%f %# '

#----------------------------------------------------------------------------------------------------------------------
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME_ANDROID_STUDIO=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
# export JAVA_HOME_MICROSOFT=$HOME/Library/Developer/Xamarin/jdk/microsoft_dist_openjdk_1.8.0.25
export JAVA_HOME_MICROSOFT=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home

export JAVA_HOME=$JAVA_HOME_MICROSOFT
#----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------
# installed with Visual Studio (Xamarin)
export ANDROID_HOME_XAMARIN=$HOME/Library/Developer/Xamarin/android-sdk-macosx
export ANDROID_NDK_HOME_XAMARIN=/usr/local/bin

# installed with Android Studio
export ANDROID_HOME_ANDROID_STUDIO=$HOME/Library/Android/sdk
# installed with brew
export ANDROID_HOME_BREW=/usr/local/share/android-sdk

export ANDROID_HOME=$ANDROID_HOME_ANDROID_STUDIO
export ANDROID_SDK_ROOT=$ANDROID_HOME

export AndroidSdkDirectory=$ANDROID_HOME
#----------------------------------------------------------------------------------------------------------------------
export ANDROID_NDK_HOME=$ANDROID_NDK_HOME_XAMARIN
#----------------------------------------------------------------------------------------------------------------------
echo "JAVA_HOME           = " $JAVA_HOME
echo "ANDROID_SDK_ROOT    = " $ANDROID_SDK_ROOT
echo "ANDROID_HOME        = " $ANDROID_HOME
echo "ANDROID_NDK_HOME    = " $ANDROID_NDK_HOME


function disk_usage_android()
{
  [ -d $ANDROID_HOME_XAMARIN ]        && echo "ANDROID_HOME_XAMARIN"        && du -sh $ANDROID_HOME_XAMARIN
  [ -d $ANDROID_HOME_ANDROID_STUDIO ] && echo "ANDROID_HOME_ANDROID_STUDIO" && du -sh $ANDROID_HOME_ANDROID_STUDIO
  [ -d $ANDROID_HOME_BREW ]           && echo "ANDROID_HOME_BREW"           && du -sh $ANDROID_HOME_BREW
}
#----------------------------------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------------------------------
alias ll='ls -al'


alias vs="open -aVisual\ Studio\ \(Preview\)"
alias vsc="code -n"
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

sys_finder_open_windows_and_tabs()
{
  source $HOME/bat/03-productivity/mac/finder-open-window-with-tabs.sh
};

sys_diverse_clean()
{
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

sys_brew_update_upgrade()
{
  brew update
  brew upgrade
}


dev_nuget_nuke()
{ 
  source $HOME/bat/01-system-integration/mac/nuget/clean.sh
};

dev_info_dump()
{
  dev_dotnet_info_dump 
  dev_android_info_dump
  dev_ios_info_dump
}

dev_dotnet_info_dump()
{ 
  echo "=============================================================================================================="
  echo "Microsoft .NET"
  echo "dotnet --info"
  dotnet --info
  echo "dotnet --list-runtimes"
  dotnet --list-runtimes
  echo "dotnet --list-sdks"  
  dotnet --list-sdks  
  echo "--------------------------------------------------------------------------------------------------------------"
  echo "dotnet workload list"
  dotnet workload list
  echo "--------------------------------------------------------------------------------------------------------------"
  echo "dotnet tool list --global"
  dotnet tool list --global
  echo "--------------------------------------------------------------------------------------------------------------"
  echo "dotnet new --list"
  dotnet new --list
}

dev_android_info_dump()
{ 
  echo "=============================================================================================================="
  echo "Google Android"
  echo "JAVA_HOME"
  echo $JAVA_HOME
  echo "ANDROID_SDK_ROOT"
  echo $ANDROID_SDK_ROOT
  echo "ANDROID_HOME"
  echo $ANDROID_HOME
};

dev_ios_info_dump()
{ 
  echo "=============================================================================================================="
  echo "Apple"
  /usr/bin/xcodebuild -version
};

dev_dotnet_workloads_install()
{ 
  source $HOME/bat/01-system-integration/mac/dotnet/workload/install.sh
};


dev_dotnet_tools_reinstall()
{ 
  source $HOME/bat/01-system-integration/mac/02-install/install-dotnet-tools.sh
};

dev_dotnet_tool_cake_install_2_3_0()
{ 
  dotnet tool \
    uninstall \
      --global \
        Cake.Tool

  dotnet tool \
    install \
      --global \
        Cake.Tool \
          --version 2.3.0
};

dev_dotnet_autocomplete ()
{
  # https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#bash
  # https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#zsh

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

compdef dev_dotnet_autocomplete dotnet

# https://docs.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete
# dotnet_zsh_complete()
# {
#   local completions=("$(dotnet complete "$words")")
# 
#   reply=( "${(ps:\n:)completions}" )
# 
#   compctl -K dotnet_zsh_complete dotnet
# }

dev_dotnet_clean()
{
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
#----------------------------------------------------------------------------------------------------------------------

jdk()
{
      version=$1
      unset JAVA_HOME;
      export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
      java -version
};


#----------------------------------------------------------------------------------------------------------------------
# Open Firefox moljac/holisticware

# if firefox is opened this will open additonal tabs
browse_moljac()
{
  source $HOME/bat.private/mac/firefox-moljac.sh 
};

rider()
{
  open -a \
    Rider \
      --args \
        $1
  # /Applications/Rider.app/Contents/MacOS/rider
};

# source $HOME/bat/03-productivity/mac/clear-screen-and-term-buffer.sh
clean_term_screen_and_buffer()
{
  source $HOME/bat/01-system-integration/mac/zsh/functions/clean_term_screen_and_buffer
};

brew_clean_update()
{
    clean_term_screen_and_buffer

    brew cleanup
    brew autoremove

    brew update
    brew upgrade

    brew cleanup
    brew autoremove

    source $HOME/bat/01-system-integration/mac/02-install/download/brew-01-upgrade.sh
};

open_browser_firefox_moljac()
{
  source $HOME/bat.private/mac/firefox-moljac.sh
};

open_browser_edge_moljac_microsoft()
{
  source $HOME/bat.private/mac/edge-moljac-microsoft.sh
};

open_browser_edge_beta_moljac_microsoft()
{
  source $HOME/bat.private/mac/edge-beta-moljac-holisticware.sh
};

open_browser_edge_dev_moljac_microsoft()
{
  source $HOME/bat.private/mac/edge-dev-moljac-holisticware.sh
};

open_finder_code_moljac_microsoft()
{
  source $HOME/bat.private/mac/finder-code-moljac-microsoft.sh
};

work_on_docs()
{
  source $HOME/bat/03-productivity/mac/finder-code-notes-docs.sh
  source $HOME/bat.private/mac/finder-code-term-moljac-microsoft.sh  
};

work_on_maui()
{
  source $HOME/bat.private/finder-code-term-maui.sh
};

work_on_ax_gps_fb_mlkit()
{
  source $HOME/bat.private/finder-code-term-xamarin-ax-gps-fb-mlkit.sh
};

work_on_ph4ct3x()
{
  source $HOME/bat.private/finder-code-term-ph4ct3x.sh
};

work_on_moljac_microsoft()
{
  source $HOME/bat.private/finder-code-term-moljac-microsoft.sh
};

work_on_moljac_holisticware()
{
  source $HOME/bat.private/finder-code-term-moljac-microsoft.sh
  source $HOME/bat.private/mchwn/firefox-moljac.sh
  source $HOME/bat.private/mchwc/firefox-moljac.sh
};

work_on_moljac()
{
    work_on_moljac_microsoft
    work_on_moljac_holisticware
};

dev_android_apk_analysis()
{
  java -jar $HOME/bin/classy-shark/ClassyShark.jar
}

dev_android_emulator_list()
{
  # start Android emulator to gain some time
  $HOME/Library/Android/sdk/emulator/emulator \
    -list-avds
};

dev_android_emulator_launch()
{
  if [ $# -lt 1 ]
  then
    echo "Usage: dev_android_emulator_launch[1] <emulator_name>"

    echo "Emulators Available:"
    $HOME/Library/Android/sdk/emulator/emulator \
      -list-avds  
    echo
    echo
    echo \
    "
    $HOME/Library/Android/sdk/emulator/emulator \
      -list-avds  
    "
    
    return
  fi

  echo "First argument: $1"

  #$HOME/Library/Developer/Xamarin/android-sdk-macosx/emulator/emulator 
  $HOME/Library/Android/sdk/emulator/emulator \
    -avd "$1" \
    &
};

dev_android_decompile_jar_jar()
{ 
    echo "$*"
    echo "using jar to decompile" $1
    echo "jar tf $1"
    jar tf $1
};

dev_android_decompile_jar_unzip()
{ 
    echo "$*"
    echo "using unzip to decompile" $1
    echo "unzip -l $1"
    unzip -l $1
};

dev_android_decompile_jar_jadx()
{ 
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
};

dev_android_decompile_jar_luyten()
{ 
    echo "$*"
    echo "launching luyten to decompile" $1.
    echo "java -jar $HOME/bin/Luyten/luyten.jar"
    echo "Drag & Drop jar to decompile..."
    echo "Luyten has no commandline support [yet]"
    java -jar $HOME/bin/Luyten/luyten.jar $1
};

dev_xcode_install_commandline_tools()
{
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

zshrc_reload()
{
  source $HOME/.zshrc 
};

dev_ios_emulator_list()
{
  xcrun simctl list
};

export IOS_DEVICE_ID="73FC4795-80E6-4ED9-9BB5-716206BDAFCD"

dev_ios_emulator_launch()
{
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

dev_dotnet_msbuildlog ()
{
  dotnet $HOME/bin/msbuildlog/bin/StructuredLogViewer.Avalonia.dll
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
  TIMESTAMP=$( date "+%Y%m%d%H%M%S" )
  echo    $TIMESTAMP

  dotnet \
      new \
          maui \
              --output ./AppMAUI.$TIMESTAMP
}

dev_dotnet_maui_new_app_hybrid_blazor ()
{
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
  csproj=( $(find . -name "AppMAUI.*.csproj") )
  
  for csp in ${csproj[@]} ; 
  do
    echo "$csp"

    dotnet \
      build \
        $csp
  done
}

dev_dotnet_maui_build_app_hybrid_blazor ()
{
  csproj=( $(find . -name "AppMAUI.HybridBlazor.*.csproj") )
  
  for csp in ${csproj[@]} ; 
  do
    echo "$csp"

    dotnet \
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
  echo $1
  echo $2
  echo $3

  for d in AppMAUI.*/ ; 
  do
    echo "$d"

    dotnet \
      build \
        $d \
        -t:Run \
        -f:net7.0-android

  done
}

dev_dotnet_maui_run_app_ios ()
{
  for d in AppMAUI.*/ ; 
  do
    echo "$d"

    dotnet \
      build \
        $d \
        -t:Run \
          -f:net7.0-ios \
          -p:_DeviceName=:v2:udid=$IOS_DEVICE_ID
  done
}

dev_dotnet_maui_build_app_hybrid_blazor ()
{
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
export PATH="$PATH:/usr/local/share/dotnet"
#----------------------------------------------------------------------------------------------------------------------




#----------------------------------------------------------------------------------------------------------------------
# https://scriptingosx.com/2019/07/moving-to-zsh-part-4-aliases-and-functions/

echo \
"
shell functions (bash/zsh) available:
    dotnet_updates          - update dotnet global tools
    launch_applications     - launch applications commonly used
    markdown_bash_execute   - execute bash code from markdown scripts (notebook/workbook styles)
    mbe                     - 
    disk_usage_android      - report disk usage by android installations
"
#----------------------------------------------------------------------------------------------------------------------
fpath=(~/bat/01-system-integration/mac/zsh/functions $fpath);

autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/dotnet_tools_update
autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/launch_applications
autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/disk_usage_android
autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/markdown_bash_execute
autoload -U $HOME/bat/01-system-integration/mac/zsh/functions/mbe
#----------------------------------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------------------------------
export PATH="$PATH:/usr/local/share/dotnet"

if type brew &>/dev/null; then
  HOMEBREW_PREFIX=/usr/local
  if [[ -r /etc/profile.d/bash_completion.sh ]]; then
    source /etc/profile.d/bash_completion.sh
  else
    for COMPLETION in /etc/bash_completion.d/*; do
      [[ -r  ]] && source 
    done
  fi
fi
