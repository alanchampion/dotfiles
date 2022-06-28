#!/bin/bash

sudo apt update &
wait
sudo apt install -y apt-transport-https stow &
wait

./purge-snaps.sh &
wait
./install-terminal.sh &
wait
./install-discord.sh
./install-mullvad.sh
./install-spotify.sh
./install-sublime.sh

sudo apt install -y python3-pip flameshot steam godot3 torbrowser-launcher firefox

sudo apt upgrade
sudo apt autoremove

# TODO
# Add PATH=$PATH:$HOME/.local/bin to .bashrc
# https://github.com/Prayag2/konsave
# 	Mouse to flat (maybe, test first)
# 	Task Switcher to Large Icons
# 	Animation Speed faster
