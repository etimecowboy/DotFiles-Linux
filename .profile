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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Chinese IM
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx

# Fix KDE bug: missing icons
# https://bugs.launchpad.net/ubuntu/+source/kubuntu-meta/+bug/1450068
# export QT_QPA_PLATFORMTHEME=kde
# . "$HOME/.cargo/env"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export GOPATH=$HOME/go/
export GOROOT=/usr/local/go
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
# export PATH="$PATH:$GOPATH/bin"

# Rust
. "$HOME/.cargo/env"
export CARGO_HOME="$HOME/.cargo"

# doom emacs
export PATH="$HOME/src/doomemacs/bin:$PATH"
## cask
export PATH="$HOME/.cask/bin:$PATH"

# Nix
if [ -e /home/xin/.nix-profile/etc/profile.d/nix.shn ]; then . /home/xin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
