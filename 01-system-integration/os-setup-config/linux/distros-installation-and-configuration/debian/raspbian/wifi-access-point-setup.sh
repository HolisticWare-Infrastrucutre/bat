#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade

sudo apt-get install dnsmasq hostapd

sudo systemctl stop dnsmasq
sudo systemctl stop hostapd


