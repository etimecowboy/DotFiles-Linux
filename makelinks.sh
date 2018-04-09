#!/bin/bash

## Global variables
srcDir="~/src/DotFiles-Linux/"

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

## Git
fileName=".gitconfig"
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

# ## tmuxinator
# dirName=".tmuxinator"
# myDir=~/"$dirName"
# if [ -d "$myDir" ]; then trash "$myDir"; fi
# ln -s "$srcDir""$dirName" "$myDir"

## latexmk
fileName=".latexmkrc"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
ln -s "$srcDir""$fileName" "$myFile"

## ranger
## FIXME: error
dirName=".config/ranger"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi
ln -s "$srcDir""$dirName" "$myDir"

## mc
dirName=".config/mc"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then mv "$myDir" "$myDir".orig; fi
ln -s "$srcDir""$dirName" "$myDir"

## vnc
dirName=".vnc"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi
ln -s "$srcDir""$dirName" "$myDir"
