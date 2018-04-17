# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# add anaconda2 bin path to PATH
# added by Anaconda2 installer
export PATH="/opt/miniconda2/bin:$PATH"
# added by Anaconda3 installer
# export PATH="/opt/anaconda3/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx

# Fix KDE bug: missing icons
# https://bugs.launchpad.net/ubuntu/+source/kubuntu-meta/+bug/1450068
export QT_QPA_PLATFORMTHEME=kde

# Boost gpu performance
export vblank_mode=0

# Install some CLI tools
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.xsh ] && source ~/.xsh

emacs --daemon
