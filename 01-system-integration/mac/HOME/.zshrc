setopt PROMPT_SUBST
# PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '
# PROMPT='$fg[cyan]%m:$fg[yellow] %T %B%30<..<%~%b %(!.#.>) '
PROMPT='%F{yellow}%3~%f %# '

#----------------------------------------------------------------------------------------------------------------------
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME_ANDROID_STUDIO=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
export JAVA_HOME_MICROSOFT=$HOME/Library/Developer/Xamarin/jdk/microsoft_dist_openjdk_1.8.0.25

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

#----------------------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-US/dotnet/core/install/macos#dependencies
export PATH=$PATH:$HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet:/usr/local/share/dotnet
export PATH=$PATH:/usr/local/share/dotnet
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
# markdown bash execute
function mbe() 
{
  if [ -f "" ]; then
    cat  | # print the file
    sed -n '/```bash/,/```/p' | # get the bash code blocks
    sed 's/```bash//g' | #  remove the ```bash
    sed 's/```//g' | # remove the trailing ```
    sed '/^$/d' | # remove empty lines
    /usr/bin/env sh ; # execute the command
  else
    echo " is not valid" ;
  fi
}

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
