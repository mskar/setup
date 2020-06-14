git remote add bit https://mskar@bitbucket.org/mskar/book.git
git remote add hub https://github.com/mskar/book
git remote add lab https://gitlab.com/mskar/book
git remote remove origin
git remote add origin https://github.com/mskar/book
git remote set-url origin https://gitlab.com/mskar/book --add
git remote set-url origin https://mskar@bitbucket.org/mskar/book.git --add
