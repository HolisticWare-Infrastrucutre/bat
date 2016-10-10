#!/bin/bash

# GNOME settings
gsettings get org.gnome.desktop.session idle-delay

gsettings set org.gnome.desktop.session idle-delay 3600
gsettings set org.gnome.desktop.screensaver lock-delay 0


gsettings set org.gnome.desktop.lockdown disable-lock-screen true
gsettings set org.gnome.desktop.screensaver lock-enabled false
