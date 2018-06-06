#!/bin/bash

hname=Krypton

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

export LANG=en_US.UTF-8

rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime

hwclock --systohc --utc

echo $hname > /etc/hostname

passwd

useradd -m -g users -G wheel,games,power,optical,storage,scanner,lp,audio,video -s /bin/bash peter

passwd peter

pacman -S sudo grub efibootmgr os-prober

EDITOR=nano visudo

nano /etc/default/grub

nano /etc/mkinitcpio.conf

mkinitcpio -p linux

grub-install --efi-directory=/boot
grub-mkconfig --output /boot/grub/grub.cfg

exit
