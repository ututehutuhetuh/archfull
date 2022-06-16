#!/bin/sh

user=$(whoami)

cd /home/$user

git clone https://github.com/ututehutuhetuh/dwm

cd /home/$user/dwm
mv * /home/$user
cd /home/$user



echo "I already untar the dwm, you just need to compile it"
echo "to compile dwmstatus run \"make and sudo make PREFIX=/usr install\""
echo "then add dwmstatus 2>&1 >/dev/null & to you're .xinitrc"

