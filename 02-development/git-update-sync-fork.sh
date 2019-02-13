#!/bin/bash

GIT_REPO=https://github.com/moljac/xamarin-android.git
DIR=xamarin-android/


git clone --recursive $REPO $DIR
cd $DIR

#-------------------------------------------------------------------------------------------------------
# https://help.github.com/articles/configuring-a-remote-for-a-fork/

# List the current configured remote repository for fork.

git remote -v

# Specify a new remote upstream repository that will be synced with the fork.

# git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.
git remote add upstream $REPO

# Verify the new upstream repository specified for the fork.

git remote -v
#-------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------
# https://help.github.com/articles/syncing-a-fork/

# Fetch the branches and their respective commits from the upstream repository. C
# Commits to master will be stored in a local branch, upstream/master.

git fetch upstream

# Check out fork's local master branch.

git checkout master

# Merge the changes from upstream/master into local master branch. 
# This brings fork's master branch into sync with the upstream repository, without losing local changes.

git merge upstream/master
#-------------------------------------------------------------------------------------------------------
