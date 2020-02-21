" vim-bootstrap (https://vim-bootstrap.com)

if filereadable(expand("~/.vimrc.plug"))
  source ~/.vimrc.plug
endif

"" Include user's local vim config
if filereadable(expand("~/.vimrc.map"))
  source ~/.vimrc.map
endif

"" Include user's local vim config
if filereadable(expand("~/.vimrc.set"))
  source ~/.vimrc.set
endif
