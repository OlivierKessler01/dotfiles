# dotfiles

A standard configuration for all my machine, whether Linux or MacOS.

Linux : Tmux, NVIM and I3 configuration files
MacOS : Tmux, NVIM, Karabiner and Aerospace configuration files

## Installation Linux

```bash
git clone ...
./create_symlinks.sh
```

## OpenFortiVPN

- first install pre-requisites: 
#https://github.com/gm-vm/openfortivpn#building-and-installing-from-source
```bash
#Already covered by bootstrap.sh
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

### download openfortivpn-webview to get the cookie
```bash
wget -qO- https://github.com/gm-vm/openfortivpn-webview/releases/download/v1.2.3-electron/openfortivpn-webview-1.2.3-x64.tar.xz | sudo tar -xvJ --transform='s/openfortivpn-webview-1.2.3-x64/openfortivpn-webview/g' -C /usr/local  && sudo ln -s /usr/local/openfortivpn-webview/openfortivpn-webview /usr/local/bin/openfortivpn-webview 
```

### Connect 
```bash
connect_vpn "<url>"
```

## Kernel tracing

1. Install lttng on the computer

```bash
install_lttng
```

2. Disable Secure boot in your BIOS, (or sign the modules but it's a pain in the arse)

3. Then start tracing

```bash
start_kernel_tracing
#Do whatever you want to trace
stop_kernel_tracing
```

Run tracecompass to read the traces located in /tmp/my-kernel-trace

```bash
tracecompass
```

## Installation MacOs

```bash
git clone ...
./create_symlinks.sh
./bootstrap_macos.sh
```
