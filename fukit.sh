
#!/bin/bash
disk=sda

dd if=/dev/zero of=/dev/"$disk" bs=512 count=1000000

(echo g; echo n; echo; echo; echo +250M; echo n; echo; echo; echo; echo t; echo 1; echo 1; echo w) | fdisk /dev/"$disk"

cryptsetup --verbose --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random luksFormat /dev/"$disk"2

cryptsetup open /dev/"$disk"2 cryptroot

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/mapper/cryptroot

mount /dev/mapper/cryptroot /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap -i /mnt base base-devel

genfstab -U -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt "sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen;locale-gen;echo LANG=en_US.UTF-8 > /etc/locale.conf;export LANG=en_US.UTF-8;rm /etc/localtime;ln -s /usr/share/zoneinfo/America/Denver /etc/localtime;hwclock --systohc --utc;echo $hname > /etc/hostname;passwd;useradd -m -g users -G wheel,games,power,optical,storage,scanner,lp,audio,video -s /bin/bash peter;passwd peter;pacman -S sudo grub efibootmgr os-prober"
