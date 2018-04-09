#!/bin/bash
# Install vnc
srcDir=pwd
dirName=".vnc"
myDir=~/"$dirName"
if [ -d "$myDir" ]; then trash "$myDir"; fi
ln -s "$srcDir""$dirName" "$myDir"
