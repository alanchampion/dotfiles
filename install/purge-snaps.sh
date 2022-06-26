#!/bin/bash

# Snap removal thanks to https://dr-knz.net/ubuntu-without-snap.html
dpkg -s snapd &> /dev/null
if [ $? -eq 0 ]
then
    # Remove installed snaps
    echo "Removing snaps"
    for p in $(snap list | awk '{print $1}'); do
      sudo snap remove $p
    done
    echo "Snaps removed"

    # Clean up the core package
    echo "Cleaning up core"
    sudo systemctl stop snapd
    for m in /snap/core/*; do
       sudo umount $m
    done
    sudo snap remove core
    echo "Core cleaned up"

    # Remove snapd
    echo "Removing snapd"
    sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd /var/cache/snapd
    echo "Snapd removed"

    echo "Writing nosnap.pref"
    cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
# To prevent repository packages from triggering the installation of Snap,
# this file forbids snapd from being installed by APT.
# For more information: https://linuxmint-user-guide.readthedocs.io/en/latest/snap.html

Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF
    echo "nosnap.pref written"

    # Instructions from https://ubuntuhandbook.org/index.php/2022/04/install-firefox-deb-ubuntu-22-04/
    sudo add-apt-repository ppa:mozillateam/ppa
    cat <<EOF | sudo tee /etc/apt/preferences.d/mozillateamppa
Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501
EOF
fi

