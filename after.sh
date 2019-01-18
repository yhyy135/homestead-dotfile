#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
#
# If you have user-specific configurations you would like
# to apply, you may also create user-customizations.sh,
# which will be run after this script.

# (after.sh is run as the vagrant user,
# if you want to execute script by root user,
# you can change configuration in Vagrantfile.)

# Changing source
# apt source
echo 'Changing software management source...'
wget -qO- git.io/superupdate.sh | sudo bash

# NPM source
echo 'Changing npm registry...\n'
npm config set registry "https://registry.npm.taobao.org"

# Composer source
echo 'Changing composer registry...\n'
composer config -g repo.packagist composer https://packagist.phpcomposer.com

# root ssh key
echo 'Copy SSH keys of vagrant user to root user...'
if [ ! -f /root/.ssh/authorized_keys ]; then
    sudo cp /home/vagrant/.ssh /root/.ssh -r
fi

# Extra software
echo 'Installing extra software...'
sudo apt-get install vim git wget curl screen unzip mlocate net-tools htop -y
cd / && sudo updatedb

# Install Oh my zsh
if [ ! -d /home/vagrant/.oh-my-zsh ]; then
    if command -v zsh >/dev/null 2>&1; then
        echo 'zsh is already installed\n'
    else
        echo 'Installing zsh first...\n'
        sudo apt install zsh -y
    fi

    echo 'Installing oh my zsh...\n'
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
    cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
else
    cd /home/vagrant/.oh-my-zsh && git pull
fi
perl -p -i -e "s/robbyrussell/ys/g" /home/vagrant/.zshrc
sudo chsh -s /usr/bin/zsh vagrant
echo 'Oh my zsh is already installed and set!'