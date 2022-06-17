#!/bin/sh

set -e 

user=$(whoami)

cd /home/$user

cp /etc/X11/xinit/xinitrc .xinitrc

echo "# dwmstatus 2>&1 >/dev/null &" >> .xinitrc
echo "# /home/adji/dwm-bar/dwm_bar.sh &" >> .xinitrc
echo "setxkbmap dvorak &" >> .xinitrc
echo "xrandr --output DisplayPort-0 --mode 1366x768" >> .xinitrc
echo "picom -f &" >> .xinitrc
echo "nitrogen --restore &" >> .xinitrc
echo "exec dwm" >> .xinitrc

cd /home/$user

git clone https://github.com/ututehutuhetuh/dwm

cd /home/$user/dwm
mv dwm-6.2/ st-0.8.3/ dwmstatus/ dwm-bar/ /home/$user
cd /home/$user

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
