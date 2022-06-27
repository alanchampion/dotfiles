#!/bin/bash

echo "Do you need to set up an ssh key with github? (Y/n)"
read response

if [ "$response" != "n" ] || [ "$response" != "no" ]; then
    cd ssh
    ./setup-ssh.sh
    cd ..
fi

echo "Do you want to install everything? (Y/n)"
read response

if [ "${response}" != "n" ] || [ "$response" != "no" ]; then
    cd install
    ./install-all.sh
    cd ..
fi

echo "Do you want to link configs? (Y/n)"
read response

if [ "${response}" != "n" ] || [ "$response" != "no" ]; then
    echo "Running firefox and sleeping for 15 seconds to get files ready."
    firefox &
    sleep 15
    kill $!

    cd stow
    ./stow.sh
    cd ..
fi
exit
