#!/bin/bash

echo 'Removing default configurations'
rm ~/.config/fish/config.fish

echo 'Stowing for fish, sublime, firefox, neovim'
# Fish
stow -vSt ~/.config/fish fish
# Terminator
stow -vSt ~/.config/terminator terminator
# Vim
stow -vSt ~/.vim_runtime vim
# Neovim
stow -vSt ~/.config/nvim neovim
# Sublime
stow -vSt ~/.config/sublime-text sublime
# Firefox user chrome
ffolder=$(ls -d ~/.mozilla/firefox/*.default-release)
mkdir -p ${ffolder}/chrome
stow -vSt ${ffolder}/chrome firefox
