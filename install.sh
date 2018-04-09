#!/bin/bash

## The first thing to do is to install ssh and get your private ssh key
if [ ! -e ~/.ssh/id_rsa ]; then exit 1; fi

## Update system packages
sudo apt-get update        # Fetches the list of available updates
sudo apt-get upgrade       # Strictly upgrades the current packages

## Install some CLI software
sudo apt-get install ssh git aptitude build-essential cmake automake clang cscope scons wget
sudo sox cmus ranger mc htop iftop nmon tmux vim fbterm fcitx-frontend-fbterm powerline w3m w3m-img

## Install some GUI software
# sudo apt-get install rxvt-unicode-256color gimp audacity

## Clone my git
dirName="src"
myDir=~/"$dirName"
if [ ! -d "$myDir" ]; then mkdir -p "$myDir"; fi
git clone --depth=1 -j8 git@github.com:etimecowboy/DotFiles-Linux.git "$myDir"/
git clone --depth=1 -j8 git@github.com:etimecowboy/DotSpacemacs.git "$myDir"/
git clone --recurse-submodules --depth=1 -j8 git@github.com:etimecowboy/DotEmacs.git "$myDir"/

## Make links
# ./makelinks.sh

### Global variables
srcDir="~/src/DotFiles-Linux/"

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

### vnc
dirName=".vnc"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi
ln -s "$srcDir""$dirName" "$myDir"

## Add-on software repositories
sudo add-apt-repository ppa:kelleyk/emacs
sudo add-apt-repository ppa:webupd8team/java
sudo aptitude update
sudo aptitude install emacs25-nox emacs25-el oracle-java9-installer

## Install Anaconda python distribution
# the root of installation is:  /opt
# the path of downloaded files is: ~/software
dirName="software"
myDir=~/"$dirName"
cd "$myDir"
if [ ! -e Anaconda2-5.1.0-Linux-x86_64.sh ]; then
    wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda2-5.1.0-Linux-x86_64.sh
fi
if [ ! -e Anaconda2-5.1.0-Linux-x86_64.sh ]; then
    wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.1.0-Linux-x86_64.sh
fi
chmod +x Anaconda2-5.1.0-Linux-x86_64.sh
chmod +x Anaconda3-5.1.0-Linux-x86_64.sh

### Anaconda2 (installed in /opt/anaconda2)
# Use this as the default python
conda="/opt/anaconda2/bin/conda"
sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
sudo "$conda" config --set show_channel_urls yes
sudo "$conda" update -n base condae
sudo "$conda" update --all
sudo "$conda" install autopep8
sudo "$conda" install -c conda-forge jupyter_contrib_nbextensions
# jupyterhub is only avaiable for python 3
"$conda" -n py35 python=3.5 anaconda
source activate py35

### Anaconda3 (installed in /opt/anaconda3)
# conda="/opt/anaconda3/bin/conda"
# sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
# sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
# sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
# sudo "$conda" config --set show_channel_urls yes
# sudo "$conda" install autopep8
# sudo "$conda" install -c conda-forge jupyter_contrib_nbextensions
# jupyterhub is only avaiable for python 3
sudo apt-get install npm nodejs-legacy
sudo "$conda" install -c conda-forge jupyterhub
# sudo "$conda" install notebook

## jupyter
## NOTE: don't use this jupyter config when using jupyterhub, otherwise you cannot start jupyterhub
# dirName=".jupyter"
# myDir=~/"$dirName"
# if [ -d "$myDir" ]; then trash "$myDir"; fi
# ln -s "$srcDir""$dirName" "$myDir"

## jupyterhub (only avaiable for python3)
fileName="jupyterhub_config.py"
myFile=~/"$fileName"
if [ -e "$myFile" ]; then mv "$myFile" "$myFile".orig; fi
ln -s "$srcDir"jupyterhub/"$fileName" "$myFile"

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

## MATLAB
if [ ! -e ~/.local/share/applications/MATLAB.desktop ]; then
    ln -s "$srcDir"/.local/share/applications/MATLAB.desktop ~/.local/share/applications/MATLAB.desktop
fi

# ## JabRef
# if [ ! -e ~/.local/share/applications/JabRef.desktop ]; then
#     ln -s $srcDir$/.local/share/applications/JabRef.desktop ~/.local/share/applications/JabRef.desktop
# fi

# ## Eclipse
# if [ ! -e ~/.local/share/applications/Eclipse.desktop ]; then
#     ln -s $srcDir$/.local/share/applications/Eclipse.desktop ~/.local/share/applications/Eclipse.desktop
# fi

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

## Update desktop database
update-desktop-database ~/.local/share/applications/
