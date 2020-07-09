"*****************************************************************************
"" Plugins
"*****************************************************************************

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "python"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'tommcdo/vim-exchange'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

"" Color
Plug 'tomasr/molokai'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" python
"" Python Bundle
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

"*****************************************************************************
"*****************************************************************************
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

" The main R plugin providing RStudio-esque features
" Autocompletion for R: https://github.com/gaalcaras/ncm-R
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

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
call plug#end()
