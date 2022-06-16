#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Kuching /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=dvorak" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

pacman -S base-devel linux-headers networkmanager neovim git wget curl xorg-server xorg-xinit xorg-xradr xorg-xsetroot xf86-video-amdgpu amd-ucode grub efibootmgr htop wine winetricks picom nitrogen

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

useradd -mG wheel adji
echo adji:password | chpasswd

echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers/adji

