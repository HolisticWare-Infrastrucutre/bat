#!/bin/bash


code --list-extensions

EXTENSIONS=\
    cake-build.cake-vscode \
    ms-vscode.PowerShell \
    ms-vscode.cpptools \
    ms-vscode.csharp \
    msjsdiag.debugger-for-chrome \
	
	

code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.csharp


# code --uninstall-extension ms-vscode.csharp