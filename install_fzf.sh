#!/bin/bash
# Install fzf

## Store current dir
configDir=$(pwd)
## Sotre parent dir (where git repos reside)
gitrootDir="$(dirname "$configDir")"

if [ ! -d "$gitrootDir" ]; then mkdir -p "$gitrootDir"; fi
cd $1

if [ ! -d "$gitrootDir"/fzf ]; then
    git clone --recurse-submodules --depth=1 git@github.com:junegunn/fzf.git
fi

cd fzf
./install
