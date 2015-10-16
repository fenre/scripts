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
sudo apt-get dist-upgrade


# Install packages
sudo apt-get install screen
sudo apt-get install -y emacs
sudo apt-get install -y python3
sudo apt-get install -y irssi
sudo apt-get install -y git-core
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev
sudo apt-get install -y libreadline-dev
sudo apt-get install -y libyaml-dev
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y sqlite3
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libxslt1-dev
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y python-software-properties
sudo apt-get install -y libffi-dev


mkdir $HOME/.irssi
cp $HOME/scripts/config/config $HOME/.irssi/
cp $HOME/scripts/config/.screenrc $HOME

#Setup Python
sudo apt-get install python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

#Setup Ruby
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

rbenv install 2.2.3
rbenv global 2.2.3
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

#Setup Rails
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
gem install rails -v 4.2.4
rbenv rehash

#Setup PostreSQL
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.3 libpq-dev

#Setup aliases
alias ..='cd ..'
alias ll='ls -alF'

#Setup Git
git config --global color.ui true
git config --global user.name "Fredrik Sudmann"
git config --global user.email "fsudmann@gmail.com"
#ssh-keygen -t rsa -C "fsudmann@gmail.com"

sudo /etc/init.d/postgresql start
sudo -u postgres createuser fenre -s
echo "Remember to set password for db user."
