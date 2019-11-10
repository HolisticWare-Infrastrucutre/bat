#/!/bin/bash


ORIGINAL_OWNER=siniypin
ORIGINAL_REPOSITORY=pjsip4net

# Configuring a remote for a fork

UPSTREAM=https://github.com/$ORIGINAL_OWNER/$ORIGINAL_REPOSITORY.git

# To sync changes you make in a fork with the original repository,
# user must configure a remote that points to the upstream repository in Git.

# List the current configured remote repository for your fork.
git remote -v

# Specify a new remote upstream repository that will be synced with the fork
git remote add upstream $UPSTREAM


# Verify the new upstream repository you've specified for your fork.
git remote -v





# Change the current working directory to your local project.
# Fetch the branches and their respective commits from the upstream repository.
# Commits to master will be stored in a local branch, upstream/master.

git fetch upstream

# Check out your fork's local master branch.

git checkout master


# Merge the changes from upstream/master into your local master branch.
# This brings user fork's master branch into sync with the upstream repository,
# without losing your local changes.
#
# If local branch didn't have any unique commits, Git will instead perform a "fast-forward":

git merge upstream/master


# Rewrite your master branch so that any commits of yours that
# aren't already in upstream/master are replayed on top of that
# other branch:

git rebase upstream/master
