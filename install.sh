#!/bin/bash
# Install required CLI tools before any other software

## The first thing to do is to install ssh and get your private ssh key
if [ ! -e ~/.ssh/id_rsa ]; then exit 1; fi

## Update system packages
sudo apt-get update        # Fetches the list of available updates
sudo apt-get upgrade       # Strictly upgrades the current packages

## Install some CLI software
sudo apt-get install ssh git aptitude build-essential cmake automake clang cscope scons wget
sudo apt-get install sox cmus ranger mc htop iftop nmon tmux vim powerline w3m w3m-img

## Install some GUI software
# sudo apt-get install rxvt-unicode-256color gimp audacity fbterm fcitx-frontend-fbterm

## Clone my git
dirName="src"
myDir=~/"$dirName"
if [ ! -d "$myDir" ]; then mkdir -p "$myDir"; fi
git clone --depth=1 -j8 git@github.com:etimecowboy/DotFiles-Linux.git "$myDir"/
git clone --depth=1 -j8 git@github.com:etimecowboy/DotSpacemacs.git "$myDir"/
git clone --recurse-submodules --depth=1 -j8 git@github.com:etimecowboy/DotEmacs.git "$myDir"/

## Make links

### Global variables
srcDir=pwd

### X window
fileName=".Xresources"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
ln -s "$srcDir""$fileName" "$myFile"

# mv ~/.xsession ~/.xsession.orig
# ln -s ~/src/DotFiles-Linux/.xsession ~/.xsession

## LXDE desktop (openbox WM)
# mv ~/.config/openbox/lxde-rc.xml ~/.config/openbox/lxde-rc.xml.orig
# ln -s ~/src/DotFiles-Linux/.config/openbox/debian-testing-jessie-lxde-rc.xml ~/.config/openbox/lxde-rc.xml

### Bash
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

### Git
fileName=".gitconfig"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
ln -s "$srcDir""$fileName" "$myFile"

### fbterm
fileName=".fbtermrc"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then trash "$myFile"; fi
ln -s "$srcDir""$fileName" "$myFile"

### urxvt
dirName=".urxvt"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi
ln -s "$srcDir""$dirName" "$myDir"

### tmux
fileName=".tmux.conf"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
ln -s "$srcDir""$fileName" "$myFile"

# ### tmuxinator
# dirName=".tmuxinator"
# myDir=~/"$dirName"
# if [ -d "$myDir" ]; then trash "$myDir"; fi
# ln -s "$srcDir""$dirName" "$myDir"

### latexmk
fileName=".latexmkrc"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
ln -s "$srcDir""$fileName" "$myFile"

### ranger
## FIXME: error
dirName=".config/ranger"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi
ln -s "$srcDir""$dirName" "$myDir"

### mc
dirName=".config/mc"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then mv "$myDir" "$myDir".orig; fi
ln -s "$srcDir""$dirName" "$myDir"
