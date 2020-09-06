# https://help.github.com/en/enterprise/2.19/user/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
ssh-keygen -t rsa -b 4096 -C "marskar@gmail.com"
eval $(ssh-agent -s)
chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
# Paste key into github settings: https://github.com/settings/keys

