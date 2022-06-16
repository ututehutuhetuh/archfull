#!/bin/sh

user = $(whoami)

cd /home/$user
mkdir /home/$user/.config/nvim
cd /home/$user/.config/nvim
git clone https://github.com/ututehutuhetuh/nvim
mv /home/$user/.config/nvim/nvim/init.vim /home/$user/.config/nvim/
rm -r /home/$user/.config/nvim/nvim/

cat << EOF

now all you need to do was run

# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

EOF
