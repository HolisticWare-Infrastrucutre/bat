#!/bin/bash

function gnome_screen_turn_off()
{
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
    gsettings set org.gnome.desktop.session idle-delay 0
}

gnome_screen_turn_off

