#!/bin/bash
# Simple script for setting up a new Ubuntu Session

# Create directory and download script- and configfiles.
cd $HOME
mkdir scripts
cd scripts
git clone https://github.com/fenre/scripts.git


# Replace grub config file to get correct console resolution
sudo cp config/grub /etc/default/grub
sudo grub-update

