#!/bin/bash
# Install oracle java instead of openjdk
## Add-on software repositories
# sudo add-apt-repository ppa:webupd8team/java
# sudo apt update
# sudo apt -y install oracle-java9-installer

sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:linuxuprising/java
sudo apt-get update
sudo apt-get -y install oracle-java11-installer
