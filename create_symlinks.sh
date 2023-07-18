#!/bin/bash 
#
rm ~/.config/nvim && true
ln -s $(pwd)/.config/nvim ~/.config

rm ~/.config/i3 && true
ln -s $(pwd)/.config/i3 ~/.config

rm ~/.config/alacritty && true
ln -s $(pwd)/.config/alacritty ~/.config

rm ~/.tmux.conf && true
ln -s $(pwd)/.tmux.conf ~

rm ~/.bash_profile && true
ln -s $(pwd)/.bash_profile ~
