#!/bin/bash

# Install discord
cd ~/Downloads
wget --content-disposition "https://discord.com/api/download?platform=linux&format=deb"
sudo apt-get install -y ./discord-*.deb
cd -
