#!/usr/bin/bash

# Install common software I use
sudo dnf update 
sudo dnf install maim xclip redshift redshift-gtk \
i3 pavucontrol ripgrep picom nitrogen g++ git alacritty nvim \
xrandr autorandr

#Install node
wget https://rpm.nodesource.com/setup_19.x -O node.sh
chmod +x node.sh
/bin/bash node.sh
rm node.sh

#Set-up the timezone
timedatectl set-timezone Europe/Paris


