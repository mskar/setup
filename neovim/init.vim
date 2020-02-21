" vim-bootstrap (https://vim-bootstrap.com)
if filereadable(expand("~/.config/nvim/plug.vim"))
  source ~/.config/nvim/plug.vim
endif

if filereadable(expand("~/.config/nvim/set.vim"))
  source ~/.config/nvim/set.vim
endif

if filereadable(expand("~/.config/nvim/map.vim"))
  source ~/.config/nvim/map.vim
endif
