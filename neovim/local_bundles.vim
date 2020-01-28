"*****************************************************************************
"" Plug user install packages
"*****************************************************************************

" To add extra packages to vim, add them below
" eg (for github):

" Plug 'user/repository'

" or (for anywhere else):

" Plug 'url'

" https://github.com/ncm2/ncm2#install
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" the main R plugin providing RStudio-esque features
" autocompletion for R: https://github.com/gaalcaras/ncm-R
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
" Vim 8 only
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" Optional: for snippet support
" Further configuration might be required, read below
" Plug 'sirver/UltiSnips' " provided below
Plug 'ncm2/ncm2-ultisnips'

" https://github.com/SirVer/ultisnips#quick-start
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Nvim-R handles citation of its own: https://github.com/jalvesaq/Nvim-R/issues/346
" but there is also zotcite: https://github.com/jalvesaq/zotcite
Plug 'jalvesaq/zotcite'

" https://github.com/neovim/neovim/issues/1822#issuecomment-233152833
Plug 'bfredl/nvim-miniyank'

" R setup: https://kadekillary.work/post/nvim-r/
" R setup: https://github.com/beigebrucewayne/vim-ide-4-all/blob/master/R-neovim.md
" For Rmarkdown syntax
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" From Vimcast 73: http://vimcasts.org/episodes/neovim-eyecandy/
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'

"" Color
" Plug 'dracula/vim', { 'as': 'dracula' }
