#!/bin/bash

if [ -z "$1" ]; then
    echo "[ERROR]: commit message needed"
    exit 1
fi

echo backup configs
cp ~/.bashrc ./bashrc
cp ~/.emacs ./emacs
cp ~/.gitconfig ./gitconfig
cp ~/.config/awesome/rc.lua ./awesome_conf.lua
cp ~/.config/terminator/config ./terminator.config
cp ~/.config/zathura/zathurarc ./
cp ~/.offlineimaprc ./offlineimaprc
cp ~/.offlineimap.py ./offlineimap.py
cp ~/.authinfo.gpg ./authinfo.gpg

echo backup pacman database
tar -cjf pacman_database.tar.bz2 /var/lib/pacman/local

git add .
git ct -m "$1"
git push

echo "[DONE]"
