" vim-bootstrap (https://vim-bootstrap.com)

if filereadable(expand("~/.vimrc.plug"))
  source ~/.vimrc.plug
endif

if filereadable(expand("~/.vimrc.map"))
  source ~/.vimrc.map
endif

if filereadable(expand("~/.vimrc.set"))
  source ~/.vimrc.set
endif
