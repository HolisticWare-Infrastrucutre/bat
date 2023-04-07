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

export ANDROID_HOME=$ANDROID_HOME_XAMARIN
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

#----------------------------------------------------------------------------------------------------------------------
## aliases cannot have arguments, using functions instead
setopt complete_aliases

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
#----------------------------------------------------------------------------------------------------------------------

function jdk()
{
      version=$1
      unset JAVA_HOME;
      export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
      java -version
}
