#!/bin/bash
# Simple script for setting up a new Ubuntu Session

# Get started
sudo apt-get install -y curl
sudo apt-get install -y git

# Create directory and download script- and configfiles.
cd $HOME
git clone https://github.com/fenre/scripts.git
cd scripts



# Replace grub config file to get correct console resolution
sudo cp $HOME/scripts/config/grub /etc/default/grub
sudo update-grub


# Update apt and get the latest dist-update
sudo apt-get update
sudo do-release-upgrade

# Install packages
sudo apt-get install screen
sudo apt-get install -y emacs
sudo apt-get install -y python3
sudo apt-get install -y irssi


mkdir $HOME/.irssi
cp $HOME/script/config/config $HOME/.irssi/
cp $HOME/scripts/config/.screenrc $HOME
