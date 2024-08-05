#!/usr/bin/bash

# Install common software I use
sudo dnf update 
sudo dnf install maim xclip redshift redshift-gtk \
i3 pavucontrol ripgrep picom nitrogen g++ git alacritty nvim \
xrandr autorandr
## Needed to build kernel modules (like lttng)
sudo dnf install kernel-devel
## Tracing
sudo dnf install lttng-ust lttng-tools
## nodeJS
wget https://rpm.nodesource.com/setup_20.x -O node.sh
chmod +x node.sh
/bin/bash node.sh
rm node.sh

# Set-up the timezone
timedatectl set-timezone Europe/Paris


