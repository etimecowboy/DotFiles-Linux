#!/bin/bash
# Install emacs25 on Ubuntu

## Add-on software repositories
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt-get install emacs25-nox emacs25-el

## Global variables
srcDir=pwd

## spacemacs
cd ~/src
git clone --depth=1 git@github.com:syl20bnr/spacemacs.git
fileName=".spacemacs"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
ln -s "$srcDir""$fileName" "$myFile"

if [ -d "~/.emacs.d" ]; then mv ~/.emacs.d ~/.emacs.d.orig; fi
# ln -s ~/src/DotEmacs ~/.emacs.d # my old emacs config
ln -s ~/src/spacemacs ~/.emacs.d
ln -s ~/src/DotSpacemacs/chinese ~/src/spacemacs/private/chinese
ln -s ~/src/DotSpacemacs/org ~/src/spacemacs/private/org

if [ ! -d "~/.local/share/applications/" ]; then
    mkdir -p ~/.local/share/applications/
fi
ln -s ~/src/DotFiles-Linux/.local/share/applications/EmacsClient.desktop ~/.local/share/applications/EmacsClient.desktop
ln -s ~/src/DotFiles-Linux/.local/share/applications/org-protocol.desktop ~/.local/share/applications/org-protocol.desktop

## Update desktop database
update-desktop-database ~/.local/share/applications/
