#!/bin/bash
# Install rtags
# Inputs:
#   - $1 : path to the dir contains rtags files

## Install some packages
sudo apt install cmake clang libclang-dev libcppunit-dev llvm llvm-dev zlib1g zlib1g-dev libssl-dev perl

## Recovery standard path in case of conda installed
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

if [ ! -d $1 ]; then
    mkdir -p $1
    git clone --recursive https://github.com/Andersbakken/rtags.git $1
fi
cd $1
if [ -e CMakeCache.txt ]; then
    rm CMakeCache.txt
fi
env "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
env "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" make -j4
