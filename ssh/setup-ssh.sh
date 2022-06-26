echo "What's your email for github?"
read email
echo "What password do you want to use for github?"
read password

ssh-keygen -t ed25519 -N "${password}" -C "${email}" -f ~/.ssh/github_ed25519

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
