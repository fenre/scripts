#!/bin/bash
# Simple script for setting up a new Ubuntu Session

# Get started
sudo apt-get install -y curl

# Create directory and download script- and configfiles.
cd $HOME
mkdir scripts
cd scripts
git clone https://github.com/fenre/scripts.git


# Replace grub config file to get correct console resolution
sudo cp config/grub /etc/default/grub
sudo grub-update


# Update apt and get the latest dist-update
sudo apt-get update
sudo apt-get -y dist-upgrade

# Install packages
sudo apt-get install screen
sudo apt-get install -y emacs
