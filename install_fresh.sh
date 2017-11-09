#!/usr/bin/env bash

# quit when fail
set -e

if [ $(id -u) -eq 0 ] ; then
    echo "Dont run this script as ROOT !!"
    exit 1
fi

echo
echo "######################################"
echo "# installing packages # debian style #"
echo "######################################"
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


echo
echo #####################
echo # Installing Vundle #
echo #####################
echo
if git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; then : ; fi

[ ! -d ~/work ] && mkdir ~/work

echo
echo ##########################
echo # Cloning work/conffiles #
echo ##########################
echo

cd ~/work
if git clone git@github.com:cpenar/conffiles.git ; then /dev/null ;
fi

echo
echo "######################"
echo "# Linking conf files #"
echo "######################"
echo

if [ -f ~/.zshrc ] ; then
   mv ~/.zshrc ~/.zshrc.pre_install_fresh
fi

cd ~
ln -s work/conffiles/.zshrc .zshrc

echo
echo " .zshrc done"
echo

if [ ! -f .gitignore ] ; then
   ln -s work/conffiles/.gitignore_global .gitignore
fi

echo
echo " .gitignore done"
echo

if [ ! -f .vimrc ]; then
   ln -s work/conffiles/.vimrc_ultisnip .vimrc
fi

echo
echo " .vimrc done"
echo

echo
echo " .i3/config"
echo " Link i3/config or .config/i3/config to conffiles/i3_config"

echo
echo Vundle : Launch vim and run :PluginInstall
