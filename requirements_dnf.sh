#!/usr/bin/bash

sudo dnf update 
sudo dnf install maim xclip redshift redshift-gtk \
i3 pavucontrol ripgrep picom nitrogen g++ git

#Install node
wget https://rpm.nodesource.com/setup_19.x -O node.sh
chmod +x node.sh
/bin/bash node.sh
rm node.sh


