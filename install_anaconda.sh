#!/bin/bash
# Install Anaconda python distribution
# the root of installation is:  /opt
# the path of downloaded files is: ~/software

srcDir=pwd

dirName="software"
myDir=~/"$dirName"
cd "$myDir"
if [ ! -e Anaconda2-5.1.0-Linux-x86_64.sh ]; then
    wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda2-5.1.0-Linux-x86_64.sh
fi
# if [ ! -e Anaconda3-5.1.0-Linux-x86_64.sh ]; then
#     wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.1.0-Linux-x86_64.sh
# fi
chmod +x Anaconda2-5.1.0-Linux-x86_64.sh
# chmod +x Anaconda3-5.1.0-Linux-x86_64.sh
sudo ./Anaconda2-5.1.0-Linux-x86_64.sh

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
