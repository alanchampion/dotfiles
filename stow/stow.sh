#!/bin/bash

echo 'Removing default configurations'
rm ~/.config/fish/config.fish

echo 'Stowing for fish, sublime, firefox, neovim'
# Fish
mkdir -p ~/.config/fish
stow -vSt ~/.config/fish fish
# Terminator
mkdir -p ~/.config/terminator
stow -vSt ~/.config/terminator terminator
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
ffolder=$(ls -d ~/.mozilla/firefox/*.default-release)
mkdir -p ${ffolder}/chrome
stow -vSt ${ffolder}/chrome firefox
