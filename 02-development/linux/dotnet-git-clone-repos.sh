#!/bin/bash


function git_clone_repos()
{
    git clone --recursive \
        https://github.com/dotnet/corefx.git \
        ~/git/corefx/

    git clone --recursive \
        https://github.com/dotnet/coreclr.git \
        ~/git/coreclr/
}

git_clone_repos