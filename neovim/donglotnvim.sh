#!/bin/bash

set -e 

user=$(whoami)

cd /home/$user/.config/
git clone https://github.com/ututehutuhetuh/nvim
cd nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim init.vim

