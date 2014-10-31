#!/bin/bash


keytool \
	-list -v \
	-keystore /Users/moljac/.local/share/Xamarin/Mono\ for\ Android/debug.keystore \
	-alias androiddebugkey -storepass android -keypass android