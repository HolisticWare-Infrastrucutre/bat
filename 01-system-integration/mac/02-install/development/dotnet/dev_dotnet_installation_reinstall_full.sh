#!/bin/bash

# dev_dotnet_installation_reinstall_full

  source $HOME/bat/01-system-integration/mac/dotnet/nuke.sh

export PWD=$(pwd)

ttab \
    -w \
    -d $PWD \
        dev_dotnet_installation_download_install_stable

ttab \
    -d $PWD \
        "
        softwareupdate --all --install --force
        xcodebuild -license accept
        xcodebuild -runFirstLaunch
        xcodebuild -runFirstLaunch -checkForNewerComponents
        xcodebuild -downloadPlatform iOS
        "


  dev_dotnet_workload_reinstall
  dev_dotnet_tools_reinstall
  dev_dotnet_new_templates_reinstall

  source $HOME/bat/01-system-integration/mac/dotnet/workload/install-minimal.sh
  source $HOME/bat/01-system-integration/mac/dotnet/tool/install-minimal.sh
  source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install.sh
  source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install-maui.sh
  source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install-holisticware.sh

  source $HOME/bat/01-system-integration/mac/dotnet/download-preview.sh
  source $HOME/bat/01-system-integration/mac/dotnet/install-preview.sh

  source $HOME/bat/01-system-integration/mac/dotnet/workload/install-minimal.sh
  source $HOME/bat/01-system-integration/mac/dotnet/tool/install-minimal.sh

  dev_dotnet_workload_reinstall
  dev_dotnet_tools_reinstall
  dev_dotnet_new_templates_reinstall

  source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install.sh
  source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install-maui.sh
  source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install-holisticware.sh

  dev_dotnet_installation_test_standard
  dev_dotnet_installation_test_extras
