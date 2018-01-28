#!/bin/bash

MONO_CURRENT=/Library/Frameworks/Mono.framework/Versions/Current
VERSION_VISUAL_STUDIO=4.8.0
VERSION_XAMARIN_STUDIO=4.6.2

ls -al $MONO_CURRENT
sudo rm $MONO_CURRENT


sudo ln -s \
	/Library/Frameworks/Mono.framework/Versions/4.8.0 \
	/Library/Frameworks/Mono.framework/Versions/Current

ls -al $MONO_CURRENT
