# Dotfile Configuration

My configuration files for Debian/Ubuntu/Mint Linux.

Instruction taken from [here](https://gruby.medium.com/dotfile-how-to-manage-and-sync-with-git-gnu-stow-6beada1529ea)

## Installation

To set up github, copy and run the `ssh/setup-ssh.sh` file. That should clone this repo and from there you can run the install scripts and stowed dotfiles. 

For installations, run files in `install` with `./install-all.sh`. 

For stowed dotfiles, ensure stow is installed `sudo apt install stow`. 
Then navigate to the `stow` directory and run `./stow.sh`. 

## Adding New Configuration

Create a new folder with the wanted configurations in it. 

First test the stow with `stow -nvt ~/.config/fish fish`. This should output something like this: 

> LINK: config.fish => ../../Documents/dotfiles/stow/fish/config.fish

If that looks good, then you can create the link with `stow -vSt ~/.config/fish fish`. 

Then make sure to change the `stow.sh` file to create that link for other installations. 
