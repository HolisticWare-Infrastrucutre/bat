#!/bin/bash

# package sources

echo "deb http://download.mono-project.com/repo/debian wheezy main" \
	| \
	sudo tee /etc/apt/sources.list.d/mono-xamarin.list    

echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" \
	| \
	sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list  
	
	
