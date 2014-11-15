#!/bin/bash

echo $1
DIR=$1

if [ -z "$DIR" ]
then
	echo "\$DIR is empty"
else
	echo "\$DIR is NOT empty"
	cd $DIR
fi

df >> df-pre.txt

find . -type d -name "Debug" -exec rm -rf {} \;
find . -type d -name "Release" -exec rm -rf {} \;

find . -type f -name ".DS_Store" -exec rm -rf {} \;
find . -type f -name "*.suo" -exec rm -rf {} \;
find . -type f -name "*.sdf" -exec rm -rf {} \;
find . -type f -name "*.csproj.user" -exec rm -rf {} \;
find . -type f -name "*.cxproj.user" -exec rm -rf {} \;

df >> df-post.txt
