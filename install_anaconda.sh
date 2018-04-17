#!/bin/bash
# Install Anaconda python distribution
# Inputs:
#     - $1: the path to the downloaded install file: (~/software)
# anaconda installation path: (/opt)

if [ ! -d $1 ]; then mkdir -p $1; fi
configDir=$(pwd)

cd $1
if [ ! -e $1/Miniconda2-latest-Linux-x86_64.sh ]; then
    # wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda2-latest-Linux-x86_64.sh $1
    wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda2-latest-Linux-x86_64.sh
fi

chmod +x $1/Miniconda2-latest-Linux-x86_64.sh
# chmod +x Anaconda3-5.1.0-Linux-x86_64.sh
sudo $1/Miniconda2-latest-Linux-x86_64.sh

### Anaconda2 (installed in /opt/miniconda2)
# Use this as the default python
conda="/opt/miniconda2/bin/conda"
# sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
# sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
# sudo "$conda" config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
sudo "$conda" config --add channels http://mirros.ustc.edu.cn/anaconda/pkgs/free/
sudo "$conda" config --add channels http://mirros.ustc.edu.cn/anaconda/pkgs/main/
sudo "$conda" config --add channels http://mirros.ustc.edu.cn/anaconda/cloud/conda-forge/
sudo "$conda" config --set show_channel_urls yes
sudo "$conda" update -n base conda
sudo "$conda" update --all

"$conda" -n py27 python=2.7
source activate py27
"$conda" install autopep8 notebook jupyter jupyter_contrib_nbextensions # jupyterhub is only avaiable for python3
ipython kernel install --user
source deactivate

"$conda" -n py35 python=3.5
source activate py35
"$conda" install autopep8 notebook jupyterhub jupyter_contrib_nbextensions # jupyterhub is only avaiable for python3
ipython kernel install --user
source deactivate

## jupyter
## NOTE: don't use this jupyter config when using jupyterhub, otherwise you cannot start jupyterhub
# jupyterConfDir="$configDir"/.jupyter
# if [[ -d "$jupyterConfDir" ]] || [[ -L "$jupyterConfDir" ]]; then trash "$jupyterConfDir"; fi
# ln -s "$jupyterConfDir" ~/.jupyter

## jupyterhub (only avaiable for python3)
if [ -e ~/jupyterhub_config.py ]; then mv ~/jupyterhub_config.py ~/jupyterhub_config.py.orig; fi
if [ -L ~/jupyterhub_config.py ]; then trash ~/jupyterhub_config.py; fi
ln -s "$configDir"/jupyterhub/jupyterhub_config.py ~/jupyterhub_config.py
