echo "What's your email for github?"
read email
echo "What passphrase do you want to use for github?"
stty_orig=$(stty -g) # save original terminal setting.
stty -echo           # turn-off echoing.
IFS= read -r password1  # read the passphrase
echo "Retype passphrase."
IFS= read -r password2  # read the passphrase
stty "$stty_orig"    # restore terminal setting.

if [ $password1 != $password2 ]; then
    echo "Passwords do not match. Exiting"
    exit 1
fi

ssh-keygen -t ed25519 -N "${password1}" -C "${email}" -f ~/.ssh/github_ed25519

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_ed25519

chmod 700 ~/.ssh
chmod 600 ~/.ssh/github_ed25519
chmod 644 ~/.ssh/github_ed25519.pub

echo "Copy the following and add to ssh keys in github."
cat ~/.ssh/github_ed25519.pub
echo "File output. Don't copy this line."

echo "Finished?"
read

ssh -T git@github.com

echo "Want to pull down your dotfiles config? (y/N)"
read dotfiles
if [ "$dotfiles" == "y" ] || [ "$dotfiles" == "yes" ]; then
    git clone git@github.com:alanchampion/dotfiles.git
fi
