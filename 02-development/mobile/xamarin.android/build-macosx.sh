#!/bin/bash

#Install the build dependencies.

[ -d ./xamarin-android/ ] && rm -fr ./xamarin-android/

#Clone the xamarin-android repo:

git clone https://github.com/xamarin/xamarin-android.git

#Navigate to the xamarin-android directory

cd xamarin-android/

# will install all dependencies
#   including git (user want git from brew anyway, the apple-provided one is a fossil)
# make PREPARE_AUTOPROVISION=1 prepare
#   to update mono (2020-05-06 internal preview channel was on 6.10 and builds needed 6.12)
#   it's a separate step because xaprepare can crash if it updates the mono that's running it
make PREPARE_AUTOPROVISION=1 prepare-update-mono

# (Optional) Configure the build.

# (For Microsoft team members only) (Optional) Prepare external proprietary git dependencies

make prepare-external-git-dependencies

# This will clone or update a monodroid checkout in external and ensure that subsequent prepare 
# and make invocations will build proprietary components.

# Prepare the project:

#make prepare

# -or-

make prepare MSBUILD=msbuild

# -or-

make XA_INVERTED_COMMERCIAL_BUILD=true jenkins

# This will ensure that the 
#       *   build dependencies are installed, 
#       *   perform git submodule update, 
#       *   download NuGet dependencies, and 
#       *   other "preparatory" and pre-build tasks that need to be performed.

# Build the project:

# make
# -or-
# make MSBUILD=msbuild

# The default make all target builds a subset of everything, in the interests of build speed: 
# it builds only one $(TargetFrameworkVersion), and only supports the armeabi-v7a and x86 ABIs 
# (for hardware and emulator testing).

# If you want to build everything -- 
#   *   support for all $(TargetFrameworkVersion)s, 
#   *   all ABIs, 
#   *   Windows cross-compilers, etc. 
# -- then use the make jenkins target:

#make jenkins
# -or-

make jenkins MSBUILD=msbuild

# Creating installers
# Once make all or make jenkins have completed, macOS (.pkg) and Windows (.vsix) installer 
# files can be built with:

make create-installers

# Commercial installers will be created by this command if the make prepare-external-git-dependencies 
# command was ran before building.

# Building Unit Tests
# Once make all or make jenkins have completed, the unit tests may be built with:

make all-tests

# Running Unit Tests
# The xamarin-android repo contains several unit tests:

# NUnit-based unit tests, for stand-alone assemblies and utilities.

# .apk-based unit tests, which are NUnitLite-based tests that need to execute on an Android device.

# All unit tests can be executed via the make run-all-tests target:

make run-all-tests

# All NUnit-based tests can be executed via the make run-nunit-tests target:

make run-nunit-tests

# All .apk-based unit tests can be executed via the make run-apk-tests target:

make run-apk-tests