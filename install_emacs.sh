#!/bin/bash
# Install emacs25 on Ubuntu

## Store current dir
configDir=$(pwd)
## Sotre parent dir (where git repos reside)
gitrootDir="$(dirname "$configDir")"

## Install emacs25 from thiry-party repository
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt -y install emacs25 emacs25-el #emacs25-nox # if you don't like graphical emacs

## Clone spacemacs and dotfiles
if [ ! -d "$gitrootDir" ]; then mkdir -p "$gitrootDir"; fi

cd "$gitrootDir"
if [ ! -d "$gitrootDir"/DotSpacemacs ]; then
    git clone --recurse-submodules --depth=1 git@github.com:etimecowboy/DotSpacemacs.git
else
    cd DotSpacemacs
    git pull
    cd ..
fi

if [ ! -d "$gitrootDir"/spacemacs ]; then
    git clone --recurse-submodules --depth=1 git@github.com:syl20bnr/spacemacs.git
else
    cd spacemacs
    git pull
    cd ..
fi
if [ ! -d "$gitrootDir"/DotEmacs ]; then
    git clone --recurse-submodules --depth=1 git@github.com:etimecowboy/DotEmacs.git
else
    cd DotEmacs
    git pull
    cd ..
fi

if [ -d "~/.emacs.d" ]; then mv ~/.emacs.d ~/.emacs.d.orig; fi
if [ -L "~/.emacs.d" ]; then trash ~/.emacs.d; fi
# ln -s ~/src/DotEmacs ~/.emacs.d # my old emacs config
ln -s "$gitrootDir"/spacemacs ~/.emacs.d
if [ -e "~/.spacemacs" ]; then mv ~/.spacemacs ~/.spacemacs.orig; fi
if [ -L "~/.spacemacs" ]; then trash ~/.spacemacs; fi
ln -s "$gitrootDir"/DotSpacemacs/.spacemacs ~/.spacemacs

if [[ -L "$gitrootDir"/spacemacs/private/chinese ]] || [[ -d "$gitrootDir"/spacemacs/private/chinese ]]; then
    trash "$gitrootDir"/spacemacs/private/chinese
fi
if [[ -L "$gitrootDir"/spacemacs/private/org ]] || [[ -d "$gitrootDir"/spacemacs/private/org ]]; then
    trash "$gitrootDir"/spacemacs/private/org;
fi
ln -s "$gitrootDir"/DotSpacemacs/chinese "$gitrootDir"/spacemacs/private/chinese
ln -s "$gitrootDir"/DotSpacemacs/org "$gitrootDir"/spacemacs/private/org

if [ ! -d "~/.local/share/applications/" ]; then
    mkdir -p ~/.local/share/applications/
fi

if [[ -L ~/.local/share/applications/EmacsClient.desktop ]] || [[ -e ~/.local/share/applications/EmacsClient.desktop ]]; then
    trash ~/.local/share/applications/EmacsClient.desktop
fi
if [[ -L ~/.local/share/applications/org-protocol.desktop ]] || [[ -e ~/.local/share/applications/org-protocol.desktop ]]; then
    trash ~/.local/share/applications/org-protocol.desktop
fi

ln -s "$gitrootDir"/DotFiles-Linux/.local/share/applications/EmacsClient.desktop ~/.local/share/applications/EmacsClient.desktop
ln -s "$gitrootDir"/DotFiles-Linux/.local/share/applications/org-protocol.desktop ~/.local/share/applications/org-protocol.desktop

## Update desktop database
update-desktop-database ~/.local/share/applications/

# emacs&
