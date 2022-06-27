#!/bin/bash

sudo apt install -y terminator
sudo apt install -y fish
sudo apt install -y curl
cd ~/Downloads
# Oh My Fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > omf-install.fish
sudo chmod +x omf-install.fish
sudo ./omf-install.fish --noninteractive --yes
# Hack Font
wget -O "Hack Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
mkdir -p ~/.fonts
cp "Hack Nerd Font Complete.ttf" ~/.fonts
fc-cache -fv
# Starship
curl -sS https://starship.rs/install.sh > starship-install.sh
sudo chmod +x starship-install.sh
sudo ./starship-install -y
# Vim Configs
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
sudo apt install -y neovim

cd -

sudo chsh -s $(which fish)
