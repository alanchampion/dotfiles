#!/bin/bash

sudo apt update
sudo apt install -y apt-transport-https stow

chmod +x purge-snaps.sh install-*.sh
sh purge-snaps.sh
sh install-terminal.sh
sh install-discord.sh
sh install-mullvad.sh
sh install-spotify.sh
sh install-sublime.sh

sudo apt install -y python3-pip steam godot3 torbrowser-launcher firefox

sudo apt upgrade
sudo apt autoremove

# TODO
# Add PATH=$PATH:$HOME/.local/bin to .bashrc
# https://github.com/Prayag2/konsave
# 	Mouse to flat (maybe, test first)
# 	Task Switcher to Large Icons
# 	Animation Speed faster
