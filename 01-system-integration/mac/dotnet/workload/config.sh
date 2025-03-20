#!/bin/zsh

source $HOME/bat/01-system-integration/mac/01-uninstall-clean-remove-nuke/nuget.sh

export WORKLOADZ=\
"\
"
#            maui-tizen \

sudo \
    dotnet \
        workload \
            config \
                --update-mode workload-set
