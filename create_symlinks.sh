#!/bin/bash 
#
rm -r ~/.config/nvim && true
ln -s $(pwd)/.config/nvim ~/.config

rm -r ~/.config/i3 && true
ln -s $(pwd)/.config/i3 ~/.config

rm -r ~/.config/alacritty && true
ln -s $(pwd)/.config/alacritty ~/.config/

rm ~/.tmux.conf && true
ln -s $(pwd)/.tmux.conf ~

rm ~/.bash_profile && true
ln -s $(pwd)/.bash_profile ~

rm ~/.gitconfig && true
ln -s $(pwd)/.gitconfig ~

rm -r ~/.config/nitrogen && true
ln -s $(pwd)/.config/nitrogen ~/.config

