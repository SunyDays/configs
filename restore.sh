#!/bin/bash

git pull

echo restore configs
cp ./.bashrc ~/
cp ./.emacs ~/
cp ./.gitconfig ~/
cp ./awesome_conf.lua ~/.config/awesome/rc.lua
cp ./terminator.config ~/.config/terminator/config

cp ./emacs.service ~/.config/systemd/user/default.target.wants/
systemctl --user stop emacs
systemctl --user reload emacs
systemctl --user enable emacs
systemctl --user start emacsDE

echo resotre pacman database
cp pacman_database.tar.bz2 /
cd /
tar -xjvf pacman_database.tar.bz2
cd -

echo "[DONE]"
