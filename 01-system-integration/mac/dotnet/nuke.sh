#!/bin/zsh

  echo "---------------------------------------------------------------------------------------------------------------"
  echo \
  "
    sudo \\
        rm -fr \\
            /usr/local/share/dotnet/

    sudo \\
        rm -fr \\
        $HOME/.dotnet \\
        $HOME/.nuget \\
        $HOME/.aspire \\
        $HOME/.aspnet \\
        $HOME/.microsoft/usersecrets/ \\

  "

  sudo \
    rm -fr \
      /usr/local/share/dotnet/ \
      $HOME/.dotnet/

sudo \
    rm -fr \
        /usr/local/share/dotnet/

sudo \
    rm -fr \
      $HOME/.dotnet \
      $HOME/.nuget \
      $HOME/.aspire \
      $HOME/.aspnet \
      $HOME/.microsoft/usersecrets/ \

