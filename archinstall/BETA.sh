#!/bin/bash

set -e

echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
pacman -Syyu
ln -sf /usr/share/zoneinfo/Asia/Kuching /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=dvorak" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
passwd

pacman -S base-devel linux-headers networkmanager neovim git wget curl xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon amd-ucode grub efibootmgr htop wine-staging winetricks picom nitrogen ttf-font-awesome ttf-dejavu pipewire pipewire-pulse pipewire-media-session firefox powerline-fonts

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

useradd -mG wheel adji
passwd adji

EDITOR=nvim visudo

echo "if you use btrfs add "btrfs" to /etc/mkinitcpio.conf and don't forget to run mkinitcpio -p linux"

cd /home/$user

cp /etc/X11/xinit/xinitrc .xinitrc

echo "# dwmstatus 2>&1 >/dev/null &" >> .xinitrc
echo "# /home/adji/dwm-bar/dwm_bar.sh &" >> .xinitrc
echo "setxkbmap dvorak &" >> .xinitrc
echo "xrandr --output DisplayPort-0 --mode 1366x768" >> .xinitrc
echo "picom -f &" >> .xinitrc
echo "nitrogen --restore &" >> .xinitrc
echo "exec dwm" >> .xinitrc

cd /home/adji

git clone https://github.com/ututehutuhetuh/dwm

cd /home/adji/dwm
mv dwm-6.2/ st-0.8.3/ dwmstatus/ dwm-bar/ /home/adji
cd /home/adji

cd dwm-6.2/
sudo make clean install
cd ..
cd st-0.8.3/
sudo make clean install
cd .. 
cd dwmstatus
make
sudo make PREFIX=/usr install
cd ..
cd dwm-bar
chmod +x dwm_bar.sh

cd /home/adji/.config/
git clone https://github.com/ututehutuhetuh/nvim
cd nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim init.vim


