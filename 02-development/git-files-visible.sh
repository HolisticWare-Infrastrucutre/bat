#!bin/bash

find /Users/Shared/Projects -name '.gitignore' -exec chflags nohidden {} \; -print
find /Users/Shared/Projects -name '.gitattributes' -exec chflags nohidden {} \; -print
find /Users/Shared/Projects -name '.editorconfig' -exec chflags nohidden {} \; -print
