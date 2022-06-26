#!/bin/bash

# Install mullvad
cd ~/Downloads
wget --content-disposition "https://mullvad.net/download/app/deb/latest"
sudo apt install -y ./MullvadVPN-*.deb
cd -
