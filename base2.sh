#!/bin/bash
set -e

sudo pacman -S pipewire pipewire-media-session pipewire-pulse xorg-xsetroot xorg-xrandr xorg-xinit xorg-server git wget curl firefox noto-fonts ttf-dejavu powerline-fonts wine-staging picom nitrogen winetricks xclip
sudo pacman -Syyu
