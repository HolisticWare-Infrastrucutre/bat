#!/bin/bash -e

rm -fr ~/vc
rm -fr ~/devel

mkdir ~/vc
mkdir ~/devel
mkdir ~/vc/xamarin
mkdir ~/devel/diffs

cd ~/vc/xamarin/
git clone --recursive https://github.com/mono/monodevelop.git
git clone --recursive https://github.com/mono/mono-addins.git

