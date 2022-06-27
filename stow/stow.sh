#!/bin/bash

echo 'Removing default configurations'
rm ~/.config/fish/config.fish ~/.config/terminator/config ~/.vim_runtime/my_configs.vim ~/.config/nvim/init.vim
rm -rf ~/.config/omf
rm -rf ~/.config/sublime-text/Packages

echo 'Stowing for fish, sublime, firefox, neovim'
# Git
stow -vSt ~ git
# Fish
mkdir -p ~/.config/fish
stow -vSt ~/.config/fish fish
# Oh My Fish
mkdir -p ~/.config/omf
stow -vSt ~/.config/omf omf
# Terminator
mkdir -p ~/.config/terminator
stow -vSt ~/.config/terminator terminator
# Starship
stow -vSt ~/.config starship
# Vim
mkdir -p ~/.vim_runtime
stow -vSt ~/.vim_runtime vim
# Neovim
mkdir -p ~/.config/nvim
stow -vSt ~/.config/nvim neovim
# Sublime
mkdir -p ~/.config/sublime-text
stow -vSt ~/.config/sublime-text sublime
# Firefox user chrome
if [[ ! -d ~/.mozilla ]]; then
    echo "Running firefox and sleeping for 15 seconds to get files ready."
    firefox &
    sleep 15
    kill $!
fi
ffolder=$(ls -d ~/.mozilla/firefox/*.default-release)
mkdir -p ${ffolder}/chrome
stow -vSt ${ffolder}/chrome firefox
