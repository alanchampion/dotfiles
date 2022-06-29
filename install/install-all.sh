#!/bin/bash

sudo apt update &
wait
sudo apt-get install -y apt-transport-https stow

./purge-snaps.sh
./install-terminal.sh
./install-discord.sh
./install-mullvad.sh
./install-spotify.sh
./install-sublime.sh

sudo apt-get install -y python3-pip flameshot steam godot3 torbrowser-launcher firefox
