#!/bin/bash

# Tell your repository about the original one:
export USER_OWNER="redth"
export REPOSITORY="Xamarin.AndroidBinderator"

git remote add upstream \
    git://github.com/$USER_OWNER/$REPOSITORY.git

# Get the original branches: 
git fetch upstream

# Pull in the original data in to your branch: 
git pull upstream master

# Push this to your github repository: 
git push