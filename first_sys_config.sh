#!/usr/bin/env bash

# Required package
packages="git ansible"
if [ -e /etc/debian-release ]; then
   sudo apt update -y && apt install -y $packages
elif [ -e /etc/arch-release ]; then
   sudo pacman -S $packages
fi

git clone git@github.com:cpenar/ansible.git ~/work/ansible

echo Run:
echo "cd ~/work/ansible/my_base && sudo ansible-playbook site.yml"
