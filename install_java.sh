#!/bin/bash
# Install oracle java instead of openjdk
## Add-on software repositories
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java9-installer
