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

# Chinese IM
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx

# Fix KDE bug: missing icons
# https://bugs.launchpad.net/ubuntu/+source/kubuntu-meta/+bug/1450068
# export QT_QPA_PLATFORMTHEME=kde
# . "$HOME/.cargo/env"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# hardware video acceleration via vaapi for NVIDIA’s Propriety Driver
export LIBVA_DRIVER_NAME=nvidia
export MOZ_X11_EGL=1
export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1

# export PATH
export PATH
