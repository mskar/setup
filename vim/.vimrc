" vim-bootstrap (https://vim-bootstrap.com)

if filereadable(expand("~/.au.vimrc"))
  source ~/.au.vimrc
endif

if filereadable(expand("~/.plug.vimrc"))
  source ~/.plug.vimrc
endif

if filereadable(expand("~/.map.vimrc"))
  source ~/.map.vimrc
endif

if filereadable(expand("~/.set.vimrc"))
  source ~/.set.vimrc
endif
