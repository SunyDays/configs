#!/bin/bash

git pull

echo '> RESTORE CONFIGS'
cp ./bashrc ~/.bashrc
cp ./emacs ~/.emacs
cp ./gitconfig ~/gitconfig
cp ./awesome_conf.lua ~/.config/awesome/rc.lua
cp ./terminator.config ~/.config/terminator/config
cp ./zathurarc ~/.config/zathura/

cp ./offlineimaprc ~/.offlineimaprc
cp ./offlineimap.py ~/.offlineimap.py
cp ./authinfo.gpg ~/.authinfo.gpg

sudo cp ./pacman.conf /etc/
sudo cp ./configs_backup.* /etc/systemd/system/
sudo cp ./netctl@SunyDays.service /etc/systemd/system/

cp ./mkinitcpio.conf /etc
cp -rf ./mkinitcpio.d /etc

cp ./20-intel.conf /etc/X11/xorg.conf.d/

echo '> RESTORE PACKAGES'
sudo pacman -S $(cat packages.list)

echo '> RESOTRE PACMAN DATABASE'
cp pacman_database.tar.bz2 /
cd /
tar -xjvf pacman_database.tar.bz2
cd -

echo "[DONE]"
