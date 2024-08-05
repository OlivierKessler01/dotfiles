#!/usr/bin/bash

# Install common software I use
sudo dnf update 
sudo dnf install --noconfirm maim xclip redshift redshift-gtk \
i3 pavucontrol ripgrep picom nitrogen g++ git alacritty nvim \
 gcc automake autoconf make pkg-config openssl-devel xrandr \
 autorandr

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

# Add user to groups
usermod -aG olivierkessler tracing
usermod -aG olivierkessler docker

# Install nerdfonts to get icons working
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

