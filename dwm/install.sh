#!/bin/sh

user = $(whoami)

git clone https://github.com/ututehutuhetuh/dwm

cd dwm/
mv * /home/$user
cd /home/$user/dwm-6.2/
sudo make clean install
cd /home/$user/st-0.8.3/
sudo make clean install
cd /home/$user/dwmstatus/
make
echo "idk tf the command i forgor"
cd /home/$user/dwm-bar/
chmod +x dwm_bar.sh
cd /home/$user
