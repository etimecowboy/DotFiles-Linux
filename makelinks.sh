#!/bin/bash

## X window
mv ~/.Xresources ~/.Xresources.orig
ln -s ~/src/DotFiles-Linux/.Xresources ~/.Xresources
mv ~/.xsession ~/.xsession.orig
ln -s ~/src/DotFiles-Linux/.xsession ~/.xsession

## LXDE desktop (openbox WM)
# mv ~/.config/openbox/lxde-rc.xml ~/.config/openbox/lxde-rc.xml.orig
# ln -s ~/src/DotFiles-Linux/.config/openbox/debian-testing-jessie-lxde-rc.xml ~/.config/openbox/lxde-rc.xml

## Bash
mv ~/.bashrc ~/.bashrc.orig
ln -s ~/src/DotFiles-Linux/.bashrc ~/.bashrc
mv ~/.bash_logout ~/.bash_logout.orig
ln -s ~/src/DotFiles-Linux/.bash_logout ~/.bash_logout
mv ~/.profile ~/.profile.orig
ln -s ~/src/DotFiles-Linux/.profile ~/.profile

## fbterm
mv ~/.fbtermrc ~/.fbtermrc.orig
ln -s ~/src/DotFiles-Linux/.fbtermrc ~/.fbtermrc

## urxvt
mv ~/.urxvt ~/.urxvt.orig
ln -s ~/src/DotFiles-Linux/.urxvt ~/.urxvt

## tmux
ln -s ~/src/DotFiles-Linux/.tmux.conf ~/.tmux.conf

## latexmk
mv ~/.latexmkrc ~/.latexmkrc.orig
ln -s ~/src/DotFiles-Linux/.latexmkrc ~/.latexmkrc

## Emacs
ln -s ~/src/DotEmacs ~/.emacs.d
ln -s ~/src/DotFiles-Linux/.local/share/applications/EmacsClient.desktop ~/.local/share/applications/EmacsClient.desktop
ln -s ~/src/DotFiles-Linux/.local/share/applications/org-protocol.desktop ~/.local/share/applications/org-protocol.desktop
update-desktop-database ~/.local/share/applications/

## Git
mv ~/.gitconfig ~/.gitconfig.orig
ln -s ~/src/DotFiles-Linux/.gitconfig ~/.gitconfig
