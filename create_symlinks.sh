#!/bin/bash 
#
rm -r ~/.config/nvim && true
ln -s $(pwd)/.config/nvim ~/.config/nvim

rm -r ~/.config/i3 && true
ln -s $(pwd)/.config/i3 ~/.config/i3

rm -r ~/.config/alacritty && true
ln -s $(pwd)/.config/alacritty ~/.config/alacritty

rm ~/.tmux.conf && true
ln -s $(pwd)/.tmux.conf ~

rm ~/.bash_profile && true
ln -s $(pwd)/.bash_profile ~

rm ~/.zprofile && true
ln -s $(pwd)/.zprofile ~

rm ~/.aerospace.toml && true
ln -s $(pwd)/.aerospace.toml ~

rm ~/.gitconfig && true
ln -s $(pwd)/.gitconfig ~

rm -r ~/.config/nitrogen && true
ln -s $(pwd)/.config/nitrogen ~/.config/nitrogen

