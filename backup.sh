#!/bin/bash

echo '> BACKUP CONFIGS'
cp ~/.bashrc ./bashrc
cp ~/.emacs ./emacs
cp ~/.gitconfig ./gitconfig
cp ~/.config/awesome/rc.lua ./awesome_conf.lua
cp ~/.config/zathura/zathurarc ./

cp ~/.offlineimaprc ./offlineimaprc
cp ~/.offlineimap.py ./offlineimap.py
cp ~/.authinfo.gpg ./authinfo.gpg
cp ~/.Xmodmap ./Xmodmap

cp /etc/pacman.conf ./
cp /etc/systemd/system/netctl@SunyDays.service ./

cp /etc/mkinitcpio.conf ./
cp -rf /etc/mkinitcpio.d ./

cp /etc/X11/xorg.conf.d/20-intel.conf ./

cp /usr/local/bin/chromium_gpu ./
cp /usr/local/bin/hide_mouse ./
cp /usr/local/bin/lget ./
cp /usr/local/bin/lset ./
cp /usr/local/bin/wttr_msk ./
cp /usr/local/bin/hdmi_sound_toggle ./
cp /usr/local/bin/keyboard_toggle ./
cp /usr/local/bin/popcorntime_gpu ./

# cp /etc/netctl/SunyDays ./
# gpg -se SunyDays
# rm SunyDays

cp -r /boot/loader ./

echo '> BACKUP LIST OF PACKAGES'
pacman -Qqe > packages.list

echo '> BACKUP PACMAN DATABASE'
tar -cjf pacman_database.tar.bz2 /var/lib/pacman/local

echo '> DONE'
