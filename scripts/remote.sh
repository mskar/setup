git remote add bit https://maptv@bitbucket.org/maptv/setup.git
git remote add hub https://github.com/maptv/setup
git remote add lab https://gitlab.com/maptv/setup
git remote remove origin
git remote add origin https://github.com/maptv/setup
git remote set-url origin https://gitlab.com/maptv/setup --add
git remote set-url origin https://maptv@bitbucket.org/maptv/setup.git --add
