#!/bin/bash

## Global variables
srcDir="/home/xin/src/DotFiles-Linux/"


## X window
fileName=".Xresources" 
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi 
ln -s "$srcDir""$fileName" "$myFile"

# mv ~/.xsession ~/.xsession.orig
# ln -s ~/src/DotFiles-Linux/.xsession ~/.xsession


## LXDE desktop (openbox WM)
# mv ~/.config/openbox/lxde-rc.xml ~/.config/openbox/lxde-rc.xml.orig
# ln -s ~/src/DotFiles-Linux/.config/openbox/debian-testing-jessie-lxde-rc.xml ~/.config/openbox/lxde-rc.xml


## Bash
fileName=".bashrc" 
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi 
ln -s "$srcDir""$fileName" "$myFile"

fileName=".bash_logout" 
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi 
ln -s "$srcDir""$fileName" "$myFile"

fileName=".profile"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi 
ln -s "$srcDir""$fileName" "$myFile"


## fbterm
fileName=".fbtermrc"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then trash "$myFile"; fi
ln -s "$srcDir""$fileName" "$myFile"

## urxvt
dirName=".urxvt"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi  
ln -s "$srcDir""$dirName" "$myDir"


## tmux
fileName=".tmux.conf" 
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi 
ln -s "$srcDir""$fileName" "$myFile"


## tmuxinator
dirName=".tmuxinator"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi  
ln -s "$srcDir""$dirName" "$myDir"


## latexmk
fileName=".latexmkrc" 
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi 
ln -s "$srcDir""$fileName" "$myFile"

Emacs
ln -s ~/src/DotEmacs ~/.emacs.d
if [ ! -d "~/.local/share/applications/" ]; then
  mkdir -p ~/.local/share/applications/
fi
ln -s ~/src/DotFiles-Linux/.local/share/applications/EmacsClient.desktop ~/.local/share/applications/EmacsClient.desktop
ln -s ~/src/DotFiles-Linux/.local/share/applications/org-protocol.desktop ~/.local/share/applications/org-protocol.desktop

## MATLAB
if [ ! -e ~/.local/share/applications/MATLAB.desktop ]; then
    ln -s "$srcDir"/.local/share/applications/MATLAB.desktop ~/.local/share/applications/MATLAB.desktop
fi

## JabRef
if [ ! -e ~/.local/share/applications/JabRef.desktop ]; then
    ln -s $srcDir$/.local/share/applications/JabRef.desktop ~/.local/share/applications/JabRef.desktop
fi

## Eclipse
## JabRef
if [ ! -e ~/.local/share/applications/Eclipse.desktop ]; then
    ln -s $srcDir$/.local/share/applications/Eclipse.desktop ~/.local/share/applications/Eclipse.desktop
fi


## Git
fileName=".gitconfig" 
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi 
ln -s "$srcDir""$fileName" "$myFile"


## fish and fishman
# if [ ! -d "~/.config/fish/" ]; then
#   mkdir -p ~/.config/fish
# fi
# mv ~/.config/fish/config.fish ~/.config/fish/config.fish.orig
# ln -s ~/src/DotFiles-Linux/.config/fish/config.fish ~/.config/fish/config.fish
# mv ~/.config/fish/completions ~/.config/fish/completions.orig
# mkdir ~/.config/fish/completions
# ln -s ~/src/DotFiles-Linux/.config/fish/completions/fisher.fish ~/.config/fish/completions/fisher.fish
# ln -s ~/src/DotFiles-Linux/.config/fish/completions/tmuxinator.fish ~/.config/fish/completions/tmuxinator.fish
# curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
# fisher z fzf fin fnm git_util gitignore nitro

## ranger
dirName=".config/ranger"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi
ln -s "$srcDir""$dirName" "$myDir"

update-desktop-database ~/.local/share/applications/
