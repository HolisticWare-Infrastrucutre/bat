#!/bin/bash

mono -V
sudo rm /Library/Frameworks/Mono.framework/Versions/Current
sudo ln -s /Library/Frameworks/Mono.framework/Versions/4.8.0 /Library/Frameworks/Mono.framework/Versions/Current
mono -V
