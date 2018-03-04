#!/bin/bash

git pull

echo '> RESTORE CONFIGS'
cp ./bashrc ~/.bashrc
cp ./emacs ~/.emacs
cp ./gitconfig ~/gitconfig
cp ./awesome_conf.lua ~/.config/awesome/rc.lua
cp ./zathurarc ~/.config/zathura/

cp ./offlineimaprc ~/.offlineimaprc
cp ./offlineimap.py ~/.offlineimap.py
cp ./authinfo.gpg ~/.authinfo.gpg
cp ./Xmodmap ~/.Xmodmap
cp ./xinitrc ~/.xinitrc

sudo cp ./pacman.conf /etc/
sudo cp ./configs_backup.* /etc/systemd/system/
sudo cp ./netctl@SunyDays.service /etc/systemd/system/

sudo cp ./mkinitcpio.conf /etc
sudo cp -rf ./mkinitcpio.d /etc

sudo cp ./20-intel.conf /etc/X11/xorg.conf.d/

sudo cp ./chromium_gpu /usr/local/bin/
sudo cp ./hide_mouse /usr/local/bin/
sudo cp ./lget /usr/local/bin/
sudo cp ./lset /usr/local/bin/
sudo cp ./wttr_msk /usr/local/bin/
sudo cp ./hdmi_sound_toggle /usr/local/bin/
sudo cp ./keyboard_toggle /usr/local/bin/
sudo cp ./popcorntime_gpu /usr/local/bin/

echo '> RESTORE PACKAGES'
sudo pacman -S $(cat packages.list)

echo '> RESOTRE PACMAN DATABASE'
sudo cp pacman_database.tar.bz2 /
cd /
sudo tar -xjvf pacman_database.tar.bz2
cd -

echo "[DONE]"
