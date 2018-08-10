#!/bin/bash

function mono_git_clone()
{
    git clone \
        https://github.com/mono/mono.git
    cd mono
}

mono_git_clone
