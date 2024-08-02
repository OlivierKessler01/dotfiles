# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Enable vi keybinding in the bash shell 
set -o vi

# ssh-add at startup so that i3 shells don't ask for passphrase everytime
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
fi

export PATH=$PATH:/var/lib/snapd/snap/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/trace-compass
export EDITOR=/usr/local/bin/nvim

function connect_vpn() {
    HOST="$1" && PORT=443 && \
      openfortivpn-webview $HOST:$PORT 2>/dev/null \
      | sudo openfortivpn $HOST:$PORT --cookie-on-stdin
}

function enable_kernel_tracing() {
    sudo lttng destroy my-kernel-session && true
    sudo lttng create my-kernel-session --output=/tmp/my-kernel-trace
    sudo lttng enable-event --kernel sched_switch,sched_process_fork
    sudo lttng enable-event --kernel --syscall open,close,read,write,listen,accept,bind,socket,fork
}

function start_kernel_tracing() {
    sudo lttng start my-kernel-session 
}

function stop_kernel_tracing() {
    sudo lttng stop my-kernel-session 
}

function tcp_dump() {
    #first param is the interface name, second param is the port
    sudo tcpdump -i $1 -A port $2
}

PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '
