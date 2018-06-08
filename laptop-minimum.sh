#!/bin/bash

# yay
pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg
pacman -U *.pkg.tar.xz

# Wifi and ethernet
yay -S pacman -S dialog wpa_actiond ifplugd wpa_suppicant
#ask user for wifi and ethernet cards
systemctl enable netctl-auto@$wificard
systemctl enable netctl-ifplugd@$ethernetcard
