echo "What's your email for github?"
read email

ssh-keygen -t ed25519 -C "${email}" -f ~/.ssh/github_ed25519

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
