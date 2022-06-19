#!/bin/bash

set -e

sed -i -e '/^#\[multilib\]/s/.//' -e '94s/#//' /mnt/etc/pacman.conf
pacman -Syyu
timedatectl set-tmezone Asia/Kuching /etc/localtime
hwclock --systohc
sed -i '/^#en_US.UTF-8/s/.//' /etc/locale.gen
locale-gen
localectl set-locale LANG=en_US.UTF-8
localectl set-keymap --no-convert dvorak
hostnamectl set-hostname arch

echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1	localhost" >> /etc/hosts
echo "127.0.1.1	arch.localdomain	arch" >> /etc/hosts

pacman -S base-devel linux-headers networkmanager grub efibootmgr grub-btrfs btrfs-progs

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

passwd
echo "creating user adjisanteuosnatoeuhsntaeuh"
useradd -mG wheel adji
passwd adji
sleep 1
EDITOR=nvim visudo

