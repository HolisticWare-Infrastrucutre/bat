#!/bin/bash

# find . -type d -exec test -e '{}'/.git -a -e '{}'/baz -a -e '{}'/quux \;  -print
# find -type d -print0 | xargs -0 -I@@ sh -c '[ -e @@/a ] && [ -e @@/b ] && [ -e @@/c ] && echo @@'

# find . -type d -exec test -e '{}'/.git  \;  -print
# find -type d -print0 | xargs -0 -I@@ sh -c '[ -e @@/.git ] && echo @@'

find . -type d -exec test -e '{}'/.git  \;  -print | while read; do
  echo ${REPLY%/*}
done | sort -u

DIRS_REPOS=$(find . -type d -exec test -e '{}'/.git \; -print)
echo $DIRS_REPOS
for DIR_REPO in ($DIRS_REPOS) ; do 
    echo $DIR_REPO
    cd $DIR_REPO
    git pull
    git submodule update --init --recursive
done