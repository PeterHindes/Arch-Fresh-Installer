#!/bin/bash

# yay
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg
pacman -U *.pkg.tar.xz

# Wifi and ethernet
sudo pacman -S dialog wpa_actiond ifplugd wpa_supplicant
#ask user for wifi and ethernet cards
sudo systemctl enable netctl-auto@$wificard
sudo systemctl enable netctl-ifplugd@$ethernetcard
