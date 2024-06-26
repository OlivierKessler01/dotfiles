# dotfiles
Tmux, NVIM and I3 configuration files for my development environment


# OpenFortiVPN

- first install pre-requisites: 
#https://github.com/gm-vm/openfortivpn#building-and-installing-from-source
```bash
sudo dnf install --noconfirm gcc automake autoconf make pkg-config openssl-devel
```

- clone project
```bash
git clone https://github.com/gm-vm/openfortivpn.git
cd openfortivpn
```

- build project
```bash
./autogen.sh
./configure --prefix=/usr/local --sysconfdir=/etc
make
sudo make install
sudo openfortivpn --version
```

# download openfortivpn-webview to get the cookie
```bash
wget -qO- https://github.com/gm-vm/openfortivpn-webview/releases/download/v1.1.0-electron/openfortivpn-webview-1.1.0.tar.xz | sudo tar -xvJ --transform='s/openfortivpn-webview-1.1.0/openfortivpn-webview/g' \
-C /usr/local  && sudo ln -s /usr/local/openfortivpn-webview/openfortivpn-webview \
/usr/local/bin/openfortivpn-webview 
```

# Connect 
```bash
connect_vpn "<url>"
```

