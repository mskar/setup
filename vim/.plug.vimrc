"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "python"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

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
call plug#begin(expand('~/.vim/plugged'))

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

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

"*****************************************************************************
"" Plug user install packages
"*****************************************************************************

" To add extra packages to vim, add them below
" eg (for github):

" Plug 'user/repository'

" or (for anywhere else):

" Plug 'url'

" Autocompletion using language server protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
