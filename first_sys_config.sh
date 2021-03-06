#!/usr/bin/env bash

# Dont continue when script fail
set -e

# Dont be root
if [ $(id -u) -eq 0 ]; then
   echo Dont run this script as root
   echo But as a sudoer user
   exit 1
fi

# Required package
packages="git ansible"
if [ -e /etc/debian-release ]; then
   sudo apt update -y && sudo apt install -y $packages
elif [ -e /etc/arch-release ]; then
   sudo pacman -Syu --needed $packages
fi

# Required ssh key
if ! [ -f ~/.ssh/id_rsa.pub ]; then
   echo A ssh key is needed to deploy on github
   echo and been able to clone cpenar/ansible repo
   echo

   ssh-keygen -t rsa -b 4096

   echo
   echo Export ~/.ssh/id_rsa.pub to github account
   echo before reruning this script

   exit 0
fi

git clone git@github.com:cpenar/ansible.git ~/work/ansible

echo 
echo ####
echo INFO
echo ####
echo
echo Modify /etc/ansible/hosts to add your current server
echo with the right group : [desktop] or [tinyserver]
echo check ~/work/ansible/my_base/hosts.example
echo
echo Then run:
echo "cd ~/work/ansible/my_base && sudo ansible-playbook site.yml"
