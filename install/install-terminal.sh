#!/bin/bash

sudo apt-get install -y terminator fish curl

cd ~/Downloads

# Oh My Fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > omf-install.fish
sudo chmod +x omf-install.fish
fish ~/Downloads/omf-install.fish --noninteractive --yes
echo "omf install bang-bang" | fish
# Hack Font
wget -O "Hack Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
mkdir -p ~/.fonts
cp "Hack Nerd Font Complete.ttf" ~/.fonts
fc-cache -fv
# Starship
curl -sS https://starship.rs/install.sh > starship-install.sh
sudo chmod +x starship-install.sh
sh ~/Downloads/starship-install.sh -y
# Keyboard Bindings
echo "keymaps 0-127\nkeycode 58 = Escape\n" > caps-to-escape.kmap
sudo loadkeys caps-to-escape.kmap
# Vim Configs
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
sudo apt-get install -y neovim

cd -

echo "Changing shell to fish. Need user password."
chsh -s $(which fish)
