#!/bin/bash

# Install spotify
wget -O- https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg |\
	sudo gpg --dearmor -o /usr/share/keyrings/pubkey_5E3C45D7B312C643.gpg

echo "deb [signed-by=/usr/share/keyrings/pubkey_5E3C45D7B312C643.gpg] http://repository.spotify.com stable non-free" |\
	sudo tee /etc/apt/sources.list.d/spotify.list

# curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
# echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update &
wait
sudo apt-get install -y spotify-client
