# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
set -o vi

# ssh-add at startup so that i3 shells don't ask for passphrase everytim
# # ssh-add at startup so that i3 shells don't ask for passphrase everytime
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi
