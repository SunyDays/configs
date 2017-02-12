#!/bin/bash

git pull

echo restore configs
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

echo restore packages
sudo pacman -S $(cat packages.list)

echo resotre pacman database
cp pacman_database.tar.bz2 /
cd /
tar -xjvf pacman_database.tar.bz2
cd -

echo "[DONE]"
