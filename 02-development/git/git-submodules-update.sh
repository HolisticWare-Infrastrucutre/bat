#!/bin/bash

git submodule update \
    --recursive

git submodule update \
    --recursive \
    --init

git submodule foreach \
    --recursive \
    git fetch

git submodule foreach \
    --recursive \
    -remote --merge


git submodule foreach \
    'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD);' 
git submodule foreach \
    'git reset --hard origin/$(git rev-parse --abbrev-ref HEAD);' 
git submodule foreach \
    'git submodule update --recursive; git clean -dfx'

# fails if branch is not master/main
# git submodule foreach \
#     git merge origin master
# git submodule foreach \
#     git merge origin main    

git add . && git commit -m 'Update submodules to latest revisions'


git submodule foreach \
    --recursive \
        git submodule update \
            --init


