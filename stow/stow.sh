echo 'Removing default configurations'
rm ~/.config/fish/config.fish

echo 'Stowing for fish, git, neovim'
stow -vSt ~/.config/fish fish
