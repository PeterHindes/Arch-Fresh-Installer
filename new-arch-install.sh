#!/bin/bash

# Install My Stuff

# yay
pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg
pacman -U *.pkg.tar.xz

# Wifi and ethernet
pacman -S dialog wpa_actiond ifplugd wpa_supplicant
#ask user for wifi and ethernet cards
systemctl enable netctl-auto@$wificard
systemctl enable netctl-ifplugd@$ethernetcard

# chinese fonts - for ascii art ;)
yay -S adobe-source-han-sans-cn-fonts; yay -S adobe-source-han-sans-tw-fonts; yay -S adobe-source-han-serif-cn-fonts; yay -S adobe-source-han-serif-tw-fonts; yay -S noto-fonts-sc; yay -S noto-fonts-tc; yay -S wqy-microhei; yay -S wqy-zenhei; yay -S wqy-bitmapfont; yay -S ttf-arphic-ukai; yay -S ttf-arphic-uming; yay -S opendesktop-fonts; yay -S ttf-hannom; yay -S ttf-tw; yay -S ttf-twcns-fonts; yay -S ttf-ms-win8-zh_cn ; yay -S ttf-ms-win8-zh_tw ; yay -S ttf-ms-win10-zh_cn; yay -S ttf-ms-win10-zh_tw; yay -S ttf-i.bming

# Sound
yay -S alsa-firmware alsa-utils alsa-plugins pulseaudio-alsa pulseaudio pavucontrol

# i3
pacman -S i3 dmenu xorg xorg-xinit
echo \#\!"/bin/bash" >> vim ~/.xinitrc
echo exec i3 >> vim ~/.xinitrc

# Termial
yay -S terminator

# Use i3-dmenu-desktop on alt d

# Use a number=display and letter=workspace method instead of number=workspace method for i3

# Media Controlls i3

# Power Controlls i3

# Wokspace Renaming?

# Static netowrk config through dhcpcd

# DNS Settings through resolv conf
