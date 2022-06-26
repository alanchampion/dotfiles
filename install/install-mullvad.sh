#!/bin/bash

# Install mullvad
wget --content-disposition "https://mullvad.net/download/app/deb/latest"
sudo apt install -y ./MullvadVPN-*.deb

