#!/bin/bash

# if [ -z "$1" ]; then
#     echo "[ERROR]: commit message needed"
#     exit 1
# fi

echo '> BACKUP CONFIGS'
cp ~/.bashrc ./bashrc
cp ~/.emacs ./emacs
cp ~/.gitconfig ./gitconfig
cp ~/.config/awesome/rc.lua ./awesome_conf.lua
cp ~/.config/terminator/config ./terminator.config
cp ~/.config/zathura/zathurarc ./

cp ~/.offlineimaprc ./offlineimaprc
cp ~/.offlineimap.py ./offlineimap.py
cp ~/.authinfo.gpg ./authinfo.gpg

cp /etc/pacman.conf ./
cp /etc/systemd/system/configs_backup.* ./
cp /etc/systemd/system/netctl@SunyDays.service ./

# cp /etc/netctl/SunyDays ./
# gpg -se SunyDays
# rm SunyDays

echo '> BACKUP LIST OF PACKAGES'
pacman -Qqe > packages.list

echo '> BACKUP PACMAN DATABASE'
tar -cjf pacman_database.tar.bz2 /var/lib/pacman/local

# git add .
# git ct -m "$1"
# git push

echo "[DONE]"
