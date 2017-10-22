#!/usr/bin/env bash

# quit when fail
set -e

if [ $(id -u) -eq 0 ] ; then
    echo "Dont run this script as ROOT !!"
    exit 1
fi

echo
echo "#########################################"
echo "# installing packages # debian packages #"
echo "#########################################"
echo

sudo sh -c "apt update -y && apt dist-upgrade -y && apt install -y \
	zsh i3 git curl wget vim ctags"

# oh-my-zsh

echo
echo "###############################################################"
echo "# Installing oh-my-zsh                                        #"
echo "# Put user password when asked to change current shell to zsh #"
echo "###############################################################"
echo

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo
echo "# Finished installing oh-my-zsh #"
echo

[ ! -d ~/work ] && mkdir ~/work

cd ~/work

git clone git@github.com:cpenar/conffiles.git

echo
echo "######################"
echo "# Linking conf files #"
echo "######################"
echo

[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.before.link

ln -s ~/work/conffiles/.zshrc ~/.zshrc

echo
echo " .zshrc done"
echo

echo " .i3/config"
echo " Link i3/config or .config/i3/config to conffiles/i3_config"
