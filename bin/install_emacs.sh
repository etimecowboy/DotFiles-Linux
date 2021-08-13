#!/bin/bash
# Install emacs27 on Ubuntu

## Store current dir
configDir=$(pwd)
## Sotre parent dir (where git repos reside)
gitrootDir="$(dirname "$configDir")"

## Install emacs27 from thiry-party repository
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt -y install emacs27 emacs27-el #emacs25-nox # if you don't like graphical emacs

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
if [ -e "~/.emacs.d" ]; then rm ~/.emacs.d; fi
# ln -s ~/src/DotEmacs ~/.emacs.d # my old emacs config
ln -s "$gitrootDir"/spacemacs ~/.emacs.d
if [ -e "~/.spacemacs" ]; then rm ~/.spacemacs; fi
# if [ -L "~/.spacemacs" ]; then rm ~/.spacemacs; fi
ln -s "$gitrootDir"/DotSpacemacs/.spacemacs ~/.spacemacs

if [[ -L "$gitrootDir"/spacemacs/private/chinese ]] || [[ -d "$gitrootDir"/spacemacs/private/chinese ]]; then
    rm "$gitrootDir"/spacemacs/private/chinese
fi
if [[ -L "$gitrootDir"/spacemacs/private/org ]] || [[ -d "$gitrootDir"/spacemacs/private/org ]]; then
    rm "$gitrootDir"/spacemacs/private/org;
fi
if [[ -L "$gitrootDir"/spacemacs/private/snippets ]] || [[ -d "$gitrootDir"/spacemacs/private/snippets ]]; then
    rm "$gitrootDir"/spacemacs/private/snippets;
fi
ln -s "$gitrootDir"/DotSpacemacs/chinese "$gitrootDir"/spacemacs/private/chinese
ln -s "$gitrootDir"/DotSpacemacs/org "$gitrootDir"/spacemacs/private/org
ln -s "$gitrootDir"/DotSpacemacs/tmux-extra "$gitrootDir"/spacemacs/private/tmux-extra
ln -s "$gitrootDir"/DotSpacemacs/shell-extra "$gitrootDir"/spacemacs/private/shell-extra
ln -s "$gitrootDir"/DotSpacemacs/snippets-private "$gitrootDir"/spacemacs/private/snippets

if [ ! -d "~/.local/share/applications/" ]; then
    mkdir -p ~/.local/share/applications/
fi

if [[ -L ~/.local/share/applications/EmacsClient.desktop ]] || [[ -e ~/.local/share/applications/EmacsClient.desktop ]]; then
    rm ~/.local/share/applications/EmacsClient.desktop
fi
if [[ -L ~/.local/share/applications/org-protocol.desktop ]] || [[ -e ~/.local/share/applications/org-protocol.desktop ]]; then
    rm ~/.local/share/applications/org-protocol.desktop
fi

ln -s "$gitrootDir"/DotFiles-Linux/.local/share/applications/EmacsClient.desktop ~/.local/share/applications/EmacsClient.desktop
ln -s "$gitrootDir"/DotFiles-Linux/.local/share/applications/org-protocol.desktop ~/.local/share/applications/org-protocol.desktop

## install libvterm
cd $(find $HOME/.emacs.d/elpa -type d -regex "^.*vterm\-.*/build$" -print0)
conda activate py38_data
cmake ..
make

## Update desktop database
update-desktop-database ~/.local/share/applications/

# emacs&
