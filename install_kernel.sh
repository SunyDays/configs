#! /bin/bash

sudo make modules_install
sudo cp arch/x86_64/boot/bzImage /boot/vmlinuz-vanilla
sudo mkinitcpio -p vanilla
