#!/bin/bash
# Install required CLI tools before any other software
# Inputs:
#     - $1 : path to my software installation file path (~/software)
# ChangeLogs:
# - 2021.9.16
#   1. Remove git clone scripts
#   1. Remove desktop app installation and/or config scripts: urxvt
#   2. Remove some cli app installation sccripts: atool, vim, powerline-shell,

## The first thing to do is to install ssh and get your private ssh key
if [ ! -e ~/.ssh/id_rsa ]; then exit 1; fi

## Store current dir
configDir=$(pwd)
## Sotre parent dir (where git repos reside)
gitrootDir="$(dirname "$configDir")"

## make links
export IFS=";"
dotfiles=".Xresources;.inputrc;.bashrc;.bash_logout;.profile;.gitconfig;.fbtermrc;.tmux.conf;.latexmkrc;.config/ranger;.config/mc" 
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
sudo apt -y install ssh git build-essential # cmake automake clang cscope scons
sudo apt -y install aptitude htop iftop tmux rsync lrzsz curl wget net-tools iproute2
sudo apt -y install yank xclip trash-cli fzf fasd fbterm fbterm-ucimf
sudo apt -y install tree mc ranger caca-utils highlight w3m w3m-img poppler-utils mediainfo
sudo apt -y install sox cmus graphviz imagemagick

## Install python version powerline-shell instead of the powerline package for the bash prompt
#pip install powerline-shell --user

## Clone my git
# if [ ! -d "$gitrootDir" ]; then mkdir -p "$gitrootDir"; fi

# export IFS=";"
# mygits="DotFiles-Linux;DotSpacemacs" #DotEmacs
# for gitName in $mygits; do
#     if [ ! -d "$localGit" ]; then
#         git clone --recurse-submodules --depth=1 git@github.com:etimecowboy/"$gitName".git "$gitrootDir"/"$gitName"
#     fi
#     # TODO: check and handle different git status
# done



## Update desktop database
# update-desktop-database ~/.local/share/applications/

# ## Install Oracle Java
# ./install_java.sh
# cd "$configDir"

# ## Install GUI software
# ./install_gui.sh $1
# cd "$configDir"

# ## Install Emacs
# ./install_emacs.sh
# cd "$configDir"

# ## Install fzf
# ./install_fzf.sh
# cd "$configDir"

# ## Install anaconda
# ./install_anaconda.sh $1