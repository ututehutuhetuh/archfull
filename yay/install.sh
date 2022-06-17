#!/bin/bash

set -e

user=$(whoami)

cd /home/$user

git clone https://aur.archlinux.org/yay.git

cd  yay/
makepkg -sirc
