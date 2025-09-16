# Load aliases and functions from .bashrc (if you still use it)
[[ -f ~/.bashrc ]] && source ~/.bashrc

# Enable vi keybindings
bindkey -v

# Start ssh-agent if not already running
if [[ -z "$SSH_AUTH_SOCK" ]]; then
  eval "$(ssh-agent -s)"
fi

# Set default editor to Neovim
export EDITOR=/usr/local/bin/nvim

# PATH exports
export PATH=$PATH:/var/lib/snapd/snap/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/trace-compass
export PATH=$PATH:/usr/local/mongosh/bin
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# AWS default profile
export AWS_DEFAULT_PROFILE="XXXX"

tcp_dump() {
  # Usage: tcp_dump <interface> <port>
  sudo tcpdump -i "$1" -A port "$2"
}

# Prompt (similar colors to your Bash PS1)
autoload -Uz colors && colors

PROMPT='%F{cyan}%n%F{red}@%F{green}%m:%F{magenta}%~%F{red}$%f '
