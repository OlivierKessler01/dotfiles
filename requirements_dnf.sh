#!/usr/bin/bash

sudo dnf update 
sudo dnf install maim xclip redshift redshift-gtk \
i3 pavucontrol emacs ripgrep picom nitrogen g++

#Vim leetcode
pip3 install pynvim keyring browser-cookie3

#Install node
wget https://rpm.nodesource.com/setup_19.x -O node.sh
chmod +x node.sh
/bin/bash node.sh
rm node.sh


# Install Python LSP client
npm i -g pyright
