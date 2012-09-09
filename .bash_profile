# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# Red Hat distributions by default supply this file.

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Start emacs daemon
# emacs --daemon

# xmodmap ~/.xmodmap-p5q
