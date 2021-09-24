#!/bin/bash
# Install required CLI tools before any other software
# Inputs:
#     - $1 : path to my software installation file path (~/software)

## The first thing to do is to install ssh and get your private ssh key
if [ ! -e ~/.ssh/id_rsa ]; then exit 1; fi

## Store current dir
configDir=$(pwd)
## Sotre parent dir (where git repos reside)
gitrootDir="$(dirname "$configDir")"

## make links
export IFS=";"
dotfiles=".Xresources;.inputrc;.bashrc;.bash_logout;.profile;.gitconfig;.fbtermrc;.tmux.conf;.latexmkrc;.config/ranger;.config/mc;.config/powerline" 
#.local/share/applications" #.xsession;.config/openbox/lxde-rc.xml;.vnc # .urxvt
for fileName in $dotfiles; do
    myFile=~/"$fileName"
    # echo "$myFile is created..."
    if [[ -L "$myFile" ]] || [[ -d "$myFile" ]]; then trash "$myFile"; fi
    if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
    ln -s "$configDir"/"$fileName" "$myFile"
done

## Update system packages
sudo apt update        # Fetches the list of available updates
sudo apt -y upgrade    # Strictly upgrades the current packages

## Install some CLI software
sudo apt -y install ssh git build-essential aptitude ppa-purge # cmake automake clang cscope scons
sudo apt -y install most htop iftop tmux tmux-themepack-jimeh net-tools iproute2
sudo apt -y install rsync lrzsz curl wget tree vim zile yank xclip trash-cli 
sudo apt -y install fbterm fbterm-ucimf fctix fcitx-frontend-fbterm 
sudo apt -y install xfonts-wqy fonts-wqy-microhei fonts-wqy-zenhei
sudo apt -y install fzf fasd powerline powerline-gitstatus 
sudo apt -y install mc ranger caca-utils highlight w3m w3m-img poppler-utils mediainfo
sudo apt -y install sox cmus graphviz imagemagick youtube-dl ffmpeg

## For fbterm privilege
sudo usermod -aG video $USER
sudo chown root:utmp /usr/bin/fbterm
sudo chmod 6755 /usr/bin/fbterm

## Update desktop database
# update-desktop-database ~/.local/share/applications/