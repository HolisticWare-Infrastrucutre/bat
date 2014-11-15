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

find . \
		-type d -name "Debug" \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -rf {} \;
find . \
		-type d -name "Release" \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -rf {} \;


find . \
		-type f -name ".DS_Store" \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -f {} \;
find . \
		-type f -name "*.suo" \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -f {} \;
find . \
		-type f -name "*.sdf" \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -f {} \;
find . \
		-type f -name "*.csproj.user" 
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -f {} \;
find . \
		-type f -name "*.cxproj.user" \
		-not -path "*Dropbox*" \
		-not -path "*Google Drive*" \
		-exec rm -f {} \;

rm -fr ~/Library/Application\ Support/iPhone\ Simulator/6.1/Applications/*
rm -fr ~/Library/Application\ Support/iPhone\ Simulator/7.1/Applications/*
rm -fr ~/Library/Application\ Support/iPhone\ Simulator/7.0.3/Applications/*

df >> df-post.txt
