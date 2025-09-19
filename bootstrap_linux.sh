#!/usr/bin/bash

echo "Bootstrapping Fedora development machine"

# Install common software I use
sudo dnf update 
sudo dnf install --noconfirm maim xclip redshift redshift-gtk \
i3 pavucontrol ripgrep picom nitrogen g++ git alacritty \
 gcc automake autoconf make pkg-config openssl-devel xrandr \
 autorandr ripgrep snapd

sudo snap install todoist

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
sudo usermod -aG tracing olivierkessler
sudo usermod -aG docker olivierkessler

# Install nerdfonts to get icons working
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

echo "Installing nvim"

cd ~/code && git clone git@github.com:neovim/neovim.git && \
    cd neovim && make make CMAKE_BUILD_TYPE=Release && sudo make install

echo "Please reboot now !"

