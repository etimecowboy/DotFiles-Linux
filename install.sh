#!/bin/bash
# Install required CLI tools before any other software
# Inputs:
#           - $1 : path to the my src folder (where I put my git-controlled source files)

## The first thing to do is to install ssh and get your private ssh key
if [ ! -e ~/.ssh/id_rsa ]; then exit 1; fi

## Update system packages
sudo apt update        # Fetches the list of available updates
sudo apt -y upgrade    # Strictly upgrades the current packages

## Install some CLI software
sudo apt -y install ssh git aptitude build-essential cmake automake clang cscope scons wget
sudo apt -y install sox cmus ranger mc htop iftop nmon tmux vim powerline w3m w3m-img trash-cli

## Install some GUI software
# sudo apt-get install rxvt-unicode-256color gimp audacity fbterm fcitx-frontend-fbterm

## Clone my git
if [ ! -d $1 ]; then mkdir -p $1; fi
export IFS=";"
mygits="DotFiles-Linux;DotSpacemacs" #DotEmacs
for gitName in $mygits; do 
    localGit=$1/"$gitName"
    if [ ! -d "$localGit" ]; then 
        git clone --recurse-submodules --depth=1 git@github.com:etimecowboy/"$gitName".git "$localGit"
    fi
    # TODO: check and handle different git status
done

## make links
export IFS=";"
dotfiles=".Xresources;.bashrc;.bash_logout;.profile;.gitconfig;.fbtermrc;.tmux.conf;.latexmkrc;.urxvt;.config/ranger;.config/mc" #.xsession;.config/openbox/lxde-rc.xml
for fileName in $dotfiles; do
    myFile=~/"$fileName"
    # echo "$myFile is created..."
    if [[ -L "$myFile" ]] || [[ -d "$myFile" ]]; then trash "$myFile"; fi
    if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
    ln -s $1/DotFiles-Linux/"$fileName" "$myFile"
done
