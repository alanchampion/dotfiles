#!/bin/bash

echo 'Removing default configurations'
rm ~/.config/fish/config.fish

echo 'Stowing for fish, git, neovim'
stow -vSt ~/.config/fish fish
ffolder=$(ls -d ~/.mozilla/firefox/*.default-release)
# mkdir -p ${ffolder}/chrome
echo $ffolder
stow -vSt ${ffolder}/chrome firefox
echo "Done"
