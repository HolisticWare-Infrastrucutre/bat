#!/bin/bash

if ![ hash brew 2>/dev/null ] ; 
then
	/usr/bin/ruby -e \
		"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


	
