git remote add bit https://mskar@bitbucket.org/mskar/setup.git
git remote add hub https://github.com/mskar/setup
git remote add lab https://gitlab.com/mskar/setup
git remote remove origin
git remote add origin https://github.com/mskar/setup
git remote set-url origin https://gitlab.com/mskar/setup --add
git remote set-url origin https://mskar@bitbucket.org/mskar/setup.git --add
