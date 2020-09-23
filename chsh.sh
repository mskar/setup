# Allow users of group chsh to change their shells without a password
curl https://raw.githubusercontent.com/mskar/setup/master/linux/chsh -o /etc/pam.d/chsh

groupadd chsh

usermod -a -G chsh $USER
