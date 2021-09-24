#!/bin/bash
# Install graphical software
# Inputs:
#   - $1 : path to my software installation files (~/software)

## Install some GUI software
sudo apt -y install synaptic rxvt-unicode-256color gimp audacity fbterm fcitx-frontend-fbterm mupdf grsync mpv
# KDE applications
# sudo apt -y install okular kuser kcron kate

## Install some fonts
if [ -d $1/fonts ]; then
    sudo rsync -rsntpvlH --progress --delete $1/fonts /usr/local/share
    sudo fc-cache -fv
else
    echo "fonts installation failed ..."
fi

## Install sogou pinyin im
# if [ -d $1/sogoupinyin_2.2.0.0102_amd64.deb ]; then
#     sudo gdebi $1/sogoupinyin_2.2.0.0102_amd64.deb
# else
#     echo "sogoupinyin installation failed ..."
# fi

# ## JabRef
# if [ ! -e ~/.local/share/applications/JabRef.desktop ]; then
#     ln -s $srcDir$/.local/share/applications/JabRef.desktop
# ~/.local/share/applications/JabRef.desktop
# fi

# ## Eclipse
# if [ ! -e ~/.local/share/applications/Eclipse.desktop ]; then
#     ln -s $srcDir$/.local/share/applications/Eclipse.desktop
# ~/.local/share/applications/Eclipse.desktop
# fi
