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


alias edge="open -a Microsoft\ Edge $1"
# alias edge="/Applications/Microsoft\ Edge.app/Contents/MacOS/Microsoft\ Edge"

#----------------------------------------------------------------------------------------------------------------------
## aliases cannot have arguments, using functions instead
setopt complete_aliases

# zsh parameter completion for the dotnet CLI

finder_open_windows_and_tabs()
{ 
};

dotnet_workloads_reinstall()
{ 
  source $HOME/bat/01-system-integration/mac/02-install/dotnet-workloads.sh
};

dotnet_tools_reinstall()
{ 
  source $HOME/bat/01-system-integration/mac/02-install/install-dotnet-tools.sh
};

# https://docs.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete
dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

dotnet_clean()
{
  rm -fr .dotnet/
  rm -fr .nuget/
  rm -fr .mono/
  rm -fr .npm/
  rm -fr .omnisharp/

  rm -fr .quicktype-vscode/
  rm -fr .vs-kubernetes/
  rm -fr .vscode-insiders/
  rm -fr .vscode*
}

diverse_clean()
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

brew_update_upgrade()
{
  brew update
  brew upgrade

}




compctl -K _dotnet_zsh_complete dotnet

decompile_jar_jar()
{ 
    echo "$*"
    echo "using jar to decompile" $1
    echo "jar tf $1"
    jar tf $1
};

decompile_jar_unzip()
{ 
    echo "$*"
    echo "using unzip to decompile" $1
    echo "unzip -l $1"
    unzip -l $1
};

decompile_jar_jadx()
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

decompile_jar_luyten()
{ 
    echo "$*"
    echo "launching luyten to decompile" $1.
    echo "java -jar $HOME/bin/Luyten/luyten.jar"
    echo "Drag & Drop jar to decompile..."
    echo "Luyten has no commandline support [yet]"
    java -jar $HOME/bin/Luyten/luyten.jar $1
};

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
  source $HOME/bat.private/firefox-moljac.sh 
};

rider()
{
  /Applications/Rider.app/Contents/MacOS/rider $1
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
};

restore_firefox_moljac()
{
  source $HOME/bat.private/firefox-moljac.sh
};

restore_edge_moljac_microsoft()
{
  source $HOME/bat.private/edge-moljac-microsoft.sh
};

restore_edge_beta_moljac_microsoft()
{
  source $HOME/bat.private/edge-beta-moljac-holisticware.sh
};

restore_edge_dev_moljac_microsoft()
{
  source $HOME/bat.private/edge-dev-moljac-holisticware.sh
};

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

autoload -U ~/bat/01-system-integration/mac/zsh/functions/dotnet_tools_update
autoload -U ~/bat/01-system-integration/mac/zsh/functions/launch_applications
autoload -U ~/bat/01-system-integration/mac/zsh/functions/disk_usage_android
autoload -U ~/bat/01-system-integration/mac/zsh/functions/markdown_bash_execute
autoload -U ~/bat/01-system-integration/mac/zsh/functions/mbe
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
