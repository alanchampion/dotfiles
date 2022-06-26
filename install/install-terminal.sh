#!/bin/bash

sudo apt install -y terminator
sudo apt install -y fish
# Hack Font
cd ~/Downloads
wget -O "Hack Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
mkdir -p ~/.fonts
cp "Hack Nerd Font Complete.ttf" ~/.fonts
fc-cache -fv
cd -
# Starship
curl -sS https://starship.rs/install.sh | sudo sh
# Vim Configs
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
sudo apt install -y neovim

chsh -s $(which fish)
