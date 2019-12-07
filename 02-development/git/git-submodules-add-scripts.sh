#!/bin/bash

mkdir ./externals/
mkdir ./externals/scripts/
mkdir ./externals/devops/


git submodule add \
    https://github.com/holisticware-xamarin/HolisticWare.Cake.Scripts.git \
    ./externals/scripts/cake/
git submodule add \
    https://github.com/holisticware-xamarin/HolisticWare.Bash.Scripts.git \
    ./externals/scripts/bash/
git submodule add \
    https://github.com/holisticware-xamarin/HolisticWare.Pwsh.Scripts.git \
    ./externals/scripts/pwsh/

git submodule add \
    https://github.com/holisticware-xamarin/HolisticWare.GitHub.Actions.Scripts.git \
    ./externals/devops/github-actions/
git submodule add \
    https://github.com/holisticware-xamarin/HolisticWare.GitLab.Scripts.git \
    ./externals/devops/gitlab/
git submodule add \
    https://github.com/holisticware-xamarin/HolisticWare.Azure.DevOps.Scripts.git \
    ./externals/devops/azure-dev-ops/

