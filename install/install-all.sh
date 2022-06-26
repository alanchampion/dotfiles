#!/bin/bash

sudo apt update
sudo apt install -y apt-transport-https

chmod +x purge-snaps.sh install-*.sh
./purge-snaps.sh
./install-terminal.sh
./install-discord.sh
./install-mullvad.sh
./install-spotify.sh
./install-sublime.sh

sudo apt install -y python3-pip
sudo apt install -y neovim
sudo apt install -y steam
sudo apt install -y godot3
sudo apt install -y torbrowser-launcher
sudo apt install -y firefox

sudo apt upgrade
sudo apt autoremove

# TODO
# Pull down my config files
# Add PATH=$PATH:$HOME/.local/bin to .bashrc
# https://github.com/Prayag2/konsave
# 	Mouse to flat (maybe, test first)
# 	Task Switcher to Large Icons
# 	Animation Speed faster
