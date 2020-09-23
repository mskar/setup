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
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" Required:
filetype plugin indent on

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=' '
let maplocalleader='\'

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
" Use vim-unimpaired's yon and yor to toggle set number and relativenumber

let no_buffers_menu=1
silent! colorscheme molokai

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>rg :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

set autoread

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Disable visualbell
set noerrorbells visualbell t_vb=

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

set completeopt=noinsert,menuone,noselect

" https://github.com/gaalcaras/ncm-R#getting-the-snippets-to-work
" https://github.com/gaalcaras/ncm-R/blob/master/test/min_vimrc
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" http://vimcasts.org/episodes/meet-ultisnips/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" https://github.com/SirVer/ultisnips#quick-start
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" https://github.com/gaalcaras/ncm-R/blob/master/test/min_vimrc#L19
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand_or_jump)"
let g:UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_expand_or_jump)"

function! UltiSnipsExpandOrJumpOrTab()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return ""
  else
    return "\<Tab>"
  endif
endfunction

" http://sherifsoliman.com/2017/07/22/nvim-r/
" press alt+, to have Nvim-R insert the assignment operator: <-
let R_assign_map = "<A-,>"

" set a minimum source editor width
" let R_min_editor_width = 80

" make sure the console is at the bottom by making it really wide
" let R_rconsole_width = 1000

" show arguments for functions during omnicompletion
" let R_show_args = 1

" https://www.freecodecamp.org/news/turning-vim-into-an-r-ide-cd9602e8c217/
" let g:rout_follow_colorscheme = 1
" let g:Rout_more_colors = 1

" Don't expand a dataframe to show columns by default
" let R_objbr_opendf = 0
" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L2152
" Only use the mappings listed below
let R_user_maps_only = 1
" Do not replace grave accent with chunk delimiters in Rmd files
" Use alt-i to insert code chunks instead
let R_rmdchunk = 0

" vim-pandoc inserts citations with <C-x><C-o>
" disable automatic folding by vim-pandoc
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#blacklist = ["codeblock_start", "codeblock_delim"]
" In addition to vim-pandoc, zotcite and nvim-r can insert citations
" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1940"

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=10

"" Directories for swp files
set nobackup
set noswapfile
set nowritebackup

" Setting suggested by coc.nvim
" Better display for messages
set cmdheight=1 "coc recommends 2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" (In times of great desperation) allow use of the mouse
set mouse=a

" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-shape-in-the-terminal
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkon100

" Share system clipboard ("+) and unnamed ("") registers
" http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
" http://vimcasts.org/blog/2013/11/getting-vim-with-clipboard-support/
set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
set go+=a

" Neovim defaults https://neovim.io/doc/user/vim_diff.html
" 'autoindent' is enabled
" 'background' defaults to "dark" (unless set automatically by the terminal/UI)
" 'belloff' defaults to "all"
" 'compatible' is always disabled
" 'complete' excludes "i"
" 'cscopeverbose' is enabled
" 'history' defaults to 10000 (the maximum)
" 'showcmd' is enabled
" 'sidescroll' defaults to 1
" 'smarttab' is enabled
" 'tabpagemax' defaults to 50
" 'wildmenu' is enabled

" Neovim defaults?
set path+=** " Provides tab-completion for all file-related tasks
set lazyredraw " Don't redraw while executing macros (good performance config)
set showmatch " Show matching brackets when text indicator is over them
set hidden " can put buffer to the background without writing to disk, will remember history/marks.

highlight VertSplit ctermbg=NONE guibg=NONE
set fillchars+=vert:│
set laststatus=0
highlight Normal ctermfg=white ctermbg=black
"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Git
noremap ga :Gwrite<CR>
noremap <leader>w :Gwrite<CR>
noremap <leader>gc :Gwrite<bar>Gcommit<CR>
noremap <leader>gp :Gpush<CR>
noremap <leader>gu :Gpull<CR>
noremap gs :Gstatus<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :Gremove<CR>
noremap <leader>gl :Glog<CR>
noremap <leader>gg :Gwrite<CR>:Gcommit -m "working on "%<CR>:Gpush<CR>
nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Clean search (highlight)
nnoremap <silent> <leader><leader> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <leader>o :.Gbrowse<CR>

" Emacs and bash style insert mode CTRL shortcuts
" <C-a> = Move to start of the line; like in vim command mode: c_ctrl-b; To insert previously inserted text, use <C-r>. or <Alt-.> (below)
inoremap <C-a> <Home>
cnoremap <C-a> <Home>
" <C-b> = Move one character backward; the opposite of <C-f>
inoremap <C-b> <Left>
cnoremap <C-b> <Left>
" <C-d> = Delete one character forward; the opposite of <C-h>
inoremap <C-d> <C-g>u<Delete>
cnoremap <C-d> <Delete>
" <C-e> = Move to end of the line; the opposite of <C-a>; already exists in command mode: c_ctrl-e
inoremap <C-e> <End>
" <C-f> = Move one character forward; the opposite of <C-b>; <C-f> is too useful (for : / ?) to remap
inoremap <C-f> <Right>
" <C-h> = Delete one character backward; the opposite of <C-d>; already exists in command mode: c_ctrl-h
inoremap <C-h> <C-g>u<BS>
" <C-k> = Delete to end of line; the opposite of <C-u>; https://www.reddit.com/r/vim/comments/9i58q8/question_re_delete_word_forward_in_insert_mode/e6he226/; https://superuser.com/a/855997
inoremap <expr> <C-k> col(".") == col("$") ? "<Del>" : "<C-o>d$"
cnoremap <C-k> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
" <C-r> = make paste from register undoable in insert mode; already exists in command mode: c_ctrl-r
inoremap <C-r> <C-g>u<C-r>
" <C-u> = Delete to start of line; the opposite of <C-k>; already exists in command mode: c_ctrl-u
inoremap <C-u> <C-g>u<C-u>
" <C-w> = Delete word backward; opposite of <A-d>; same as <A-h>; already exists in command mode: c_ctrl-w
inoremap <C-w> <C-g>u<C-w>
" <C-y> = Paste from system clipboard (not from killring like in bash/emacs)
inoremap <C-y> <C-r>+
cnoremap <C-y> <C-r>+
" <C-_> = Undo like in bash/emacs (this works really well)
inoremap <C-_> <C-o>u

" Emacs and bash style insert mode ALT shortcuts
" <A-b> = Move one word backward; opposite of <A-f>
inoremap <A-b> <S-Left>
cnoremap <A-b> <S-Left>
" <A-c> = Capitalize letter and move forward
inoremap <A-c> <Esc>l~ea
" <A-d> = Delete word forward; opposite of <A-h> and <C-w>; https://www.reddit.com/r/vim/comments/9i58q8/question_re_delete_word_forward_in_insert_mode/e6he226/
inoremap <expr> <A-d> col(".") == col("$") ? "<Del>" : "<C-o>de"
cnoremap <A-d> <S-Right><C-w>
" <A-f> = Move one word forward; opposite of <A-b>
inoremap <A-f> <S-Right>
cnoremap <A-f> <S-Right>
" <A-h> = Delete word backward; opposite of <A-d>; same as <C-w>
inoremap <A-h> <C-g>u<C-w>
cnoremap <A-h> <C-w>
" <A-j> = Move down; opposite of <A-k>
inoremap <A-j> <Down>
cnoremap <A-j> <Down>
" <A-k> = Move up; opposite of <A-j>
inoremap <A-k> <Up>
cnoremap <A-k> <Up>
" <A-l> = Lowercase to word end; opposite of <A-u>
inoremap <A-l> <Esc>gueea
cnoremap <A-l> <C-f>guee<C-c>
" <A-t> = Swap current word with previous word
inoremap <A-t> <Esc>diwbPldepa
cnoremap <A-t> <C-f>diwbPldep<C-c>
" <A-u> = Uppercase to WORD end; opposite of <A-l>
inoremap <A-u> <Esc>gUeea
cnoremap <A-u> <C-f>gUee<C-c>
" <A-.> = Insert previously inserted text (if any)
inoremap <A-.> <Esc>a<C-r>.
cnoremap <A-.> <C-r>.
" " <A--> = Undo
inoremap <A--> <Esc>ugi
" inoremap <A--> <C-o>u

" Run :file everytime I switch to alternate file (^6)
nnoremap <C-^> <C-^><C-g>
tnoremap <C-^> <C-\><C-n><C-^><C-g>
" Run :file everytime I go thru the jump list
nnoremap <C-o> <C-o><C-g>
nnoremap <C-i> <C-i><C-g>
" Switch buffers
nnoremap <C-w>; :bn<CR><C-g>
nnoremap <C-w>, :bp<CR><C-g>
tnoremap <C-w>; <C-\><C-n>:bn<CR><C-g>
tnoremap <C-w>, <C-\><C-n>:bp<CR><C-g>
nnoremap ]b :bn<CR><C-g>
nnoremap [b :bp<CR><C-g>
tnoremap ]b <C-\><C-n>:bn<CR><C-g>
tnoremap [b <C-\><C-n>:bp<CR><C-g>

" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1075
" To recover R console after pressing <C-w>o (window only), press <C-w>u (window undo)
" https://vi.stackexchange.com/questions/241/undo-only-window
nnoremap <C-w>o :mksession! ~/session.vim<CR>:wincmd o<CR><C-g>
nnoremap <C-w>u :source ~/session.vim<CR>

" Terminal like in vim
tnoremap <C-w>+ <C-\><C-n><C-w>+
tnoremap <C-w>- <C-\><C-n><C-w>-
tnoremap <C-w>< <C-\><C-n><C-w><
tnoremap <C-w>= <C-\><C-n><C-w>=
tnoremap <C-w>> <C-\><C-n><C-w>>
tnoremap <C-w>H <C-\><C-n><C-w>H
tnoremap <C-w>J <C-\><C-n><C-w>J
tnoremap <C-w>K <C-\><C-n><C-w>K
tnoremap <C-w>L <C-\><C-n><C-w>L
tnoremap <C-w>N <C-\><C-n>
tnoremap <C-w>P <C-\><C-n><C-w>P
tnoremap <C-w>R <C-\><C-n><C-w>R
tnoremap <C-w>S <C-\><C-n><C-w>S
tnoremap <C-w>T <C-\><C-n><C-w>T
tnoremap <C-w>W <C-\><C-n><C-w>W
tnoremap <C-w>] <C-\><C-n><C-w>]
tnoremap <C-w>^ <C-\><C-n><C-w>^
tnoremap <C-w>_ <C-\><C-n><C-w>_
tnoremap <C-w>b <C-\><C-n><C-w>b
tnoremap <C-w>c <C-\><C-n><C-w>c
tnoremap <C-w>d <C-\><C-n><C-w>d
tnoremap <C-w>f <C-\><C-n><C-w>f
tnoremap <C-w>g <C-\><C-n><C-w>g
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>i <C-\><C-n><C-w>i
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w>n <C-\><C-n><C-w>n
tnoremap <C-w>o <C-\><C-n><C-w>o
tnoremap <C-w>p <C-\><C-n><C-w>p
tnoremap <C-w>q <C-\><C-n><C-w>q
tnoremap <C-w>r <C-\><C-n><C-w>r
tnoremap <C-w>s <C-\><C-n><C-w>s
tnoremap <C-w>t <C-\><C-n><C-w>t
tnoremap <C-w>v <C-\><C-n><C-w>v
tnoremap <C-w>w <C-\><C-n><C-w>w
tnoremap <C-w>x <C-\><C-n><C-w>x
tnoremap <C-w>z <C-\><C-n><C-w>z
tnoremap <C-w>} <C-\><C-n><C-w>}
tnoremap <C-w>: <C-\><C-n>:
tnoremap <C-w><C-b> <C-\><C-n><C-w>b
tnoremap <C-w><C-c> <C-\><C-n><C-w>c
tnoremap <C-w><C-d> <C-\><C-n><C-w>d
tnoremap <C-w><C-f> <C-\><C-n><C-w>f
tnoremap <C-w><C-g> <C-\><C-n><C-w>g
tnoremap <C-w><C-h> <C-\><C-n><C-w>h
tnoremap <C-w><C-i> <C-\><C-n><C-w>i
tnoremap <C-w><C-j> <C-\><C-n><C-w>j
tnoremap <C-w><C-k> <C-\><C-n><C-w>k
tnoremap <C-w><C-l> <C-\><C-n><C-w>l
tnoremap <C-w><C-n> <C-\><C-n><C-w>n
tnoremap <C-w><C-o> <C-\><C-n><C-w>o
tnoremap <C-w><C-p> <C-\><C-n><C-w>p
tnoremap <C-w><C-q> <C-\><C-n><C-w>q
tnoremap <C-w><C-r> <C-\><C-n><C-w>r
tnoremap <C-w><C-s> <C-\><C-n><C-w>s
tnoremap <C-w><C-t> <C-\><C-n><C-w>t
tnoremap <C-w><C-v> <C-\><C-n><C-w>v
tnoremap <C-w><C-w> <C-\><C-n><C-w>w
tnoremap <C-w><C-x> <C-\><C-n><C-w>x
tnoremap <C-w><C-z> <C-\><C-n><C-w>z
tnoremap <C-w><C-]> <C-\><C-n><C-w>]
tnoremap <C-w><C-^> <C-\><C-n><C-w>^
tnoremap <C-w><C-_> <C-\><C-n><C-w>_
tnoremap <C-w>; <C-\><C-n>:bn<CR>
tnoremap <C-w>, <C-\><C-n>:bp<CR>
nnoremap <C-w>; <C-\><C-n>:bn<CR>
nnoremap <C-w>, <C-\><C-n>:bp<CR>

" Fuzzy finder (FZF)
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nnoremap <silent> <leader>A :Ag<CR>
nnoremap <silent> gb :Buffers<CR>
"Recovery commands from history through FZF
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>B :BCommits<CR>
nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>C :Commands<CR>
nnoremap <silent> <leader>gf :GFiles<CR>
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>H :Helptags<CR>
nnoremap <silent> g: :History:<CR>
nnoremap <silent> g/ :History/<CR>
nnoremap <silent> <leader>m :Maps<CR>
nnoremap <silent> <leader>' :Marks<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>L :Lines<CR>
nnoremap <silent> <leader>R :Rg<CR>
nnoremap <silent> <leader>y :Filetypes<CR>
nnoremap <silent> <Leader>t :BTags<CR>
nnoremap <silent> <Leader>T :Tags<CR>
nnoremap <silent> <leader>z :FZF -m<CR>

" https://github.com/junegunn/fzf.vim#usage
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" https://github.com/ncm2/ncm2-ultisnips
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

inoremap <silent> <expr> <Tab> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_try_expand)")

inoremap <silent> <Plug>(ultisnips_try_expand) <C-R>=UltiSnipsExpandOrJumpOrTab()<CR>

snoremap <silent> <Tab> <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>

" https://github.com/neovim/neovim/issues/1822#issuecomment-233152833
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" https://vim.fandom.com/wiki/Moving_through_camel_case_words
" Use one of the following to define the camel characters.
" Stop on capital letters.
" CamelCaseWord
let g:camelchar = "A-Z"
" Also stop on numbers.
let g:camelchar = "A-Z0-9"
" Include '.' for class member, ',' for separator, ';' end-statement, " and <[< bracket starts and "'` quotes.
let g:camelchar = "A-Z0-9.,;:{([`'\""
nnoremap <silent><A-C-b> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><A-C-f> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><A-C-b> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><A-C-f> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><A-C-b> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><A-C-f> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o
au VimEnter,WinEnter * file

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake
au BufNewFile,BufRead *.snk set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au FileType snakemake let Comment="#"
au FileType snakemake setlocal completeopt=menuone,longest
au FileType snakemake setlocal tw=79 tabstop=4 shiftwidth=4 softtabstop=4

" ncm-R: https://github.com/gaalcaras/ncm-R
" requires the lines below to satisfy ncm2 dependencies
" https://github.com/ncm2/ncm2#install
" https://github.com/gaalcaras/ncm-R/blob/master/test/min_vimrc#L16
" For now, use coc in vim and ncm in neovim
" Later, try to use ncm just for r/rmd files as below
" autocmd BufEnter *.[Rr],*.Rmd call ncm2#enable_for_buffer()
" or switch to coc entirely if the R LSP gets better
" https://github.com/REditorSupport/languageserver/issues/167
autocmd BufEnter * call ncm2#enable_for_buffer()

" Nvim-R mappings
autocmd FileType r,rmd nnoremap <buffer> <C-w>a :!wmctrl -r "R Graphics" -b add,above
autocmd FileType r,rmd nnoremap <buffer> <C-w>A :!wmctrl -r "R Graphics" -b remove,above
" Keyboard shortcuts for <- -> and other operators in R specific files
" https://github.com/jalvesaq/Nvim-R/issues/85
" The trailing spaces below are intentional!
autocmd FileType r,rmd inoremap <buffer> <A-n> <Esc>:normal! a %>%<CR>a<CR>
autocmd FileType r,rmd inoremap <buffer> <A-m> <Esc>:normal! a %>%<CR>a 
autocmd FileType r,rmd inoremap <buffer> <A-i> <Esc>:normal! a %in%<CR>a 
autocmd FileType r,rmd inoremap <buffer> <A-,> <Esc>:normal! a <-<CR>a 
autocmd FileType r,rmd inoremap <buffer> <A-.> <Esc>:normal! a -><CR>a 
autocmd FileType r,rmd inoremap <buffer> <A-/> <Esc>:normal! a %/%<CR>a 
autocmd FileType rmd inoremap <buffer> <A-i> <Esc>:normal! a ```{r}<CR>```<Esc>O

autocmd FileType rmd nnoremap <buffer> <localleader><CR> :w<CR> :!Rscript -e "rmarkdown::render('%')"<CR>
autocmd FileType rmd nnoremap <buffer> <localleader>] :w<CR> :!Rscript -e "bookdown::render_book('%')"<CR>
autocmd FileType r nnoremap <buffer> <localleader><CR> :w<CR> :!Rscript %<CR>
autocmd FileType python nnoremap <buffer> <localleader><CR> :w ! python3<CR>

" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L2586
" https://github.com/beigebrucewayne/vim-ide-4-all/blob/master/R-neovim.md
" Remappings based on RStudio shortcuts: https://rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf
"" Remapping the basic :: send line
autocmd FileType r,rmd nnoremap <silent><buffer><A-Enter> :call SendLineToR("down")<CR>
autocmd FileType r nnoremap <silent><buffer><A-S-Enter> :call SendFileToR("echo")<CR>
autocmd FileType rmd nnoremap <silent><buffer><A-S-Enter> :call b:SendChunkToR("echo", "down")<CR>
"" Remapping selection :: send multiple lines + echo lines
vmap <A-Enter> <Plug>REDSendSelection
vmap <localleader>o <Plug>RSendSelAndInsertOutput
autocmd FileType r,rmd nnoremap <silent><buffer><A-S-0> :call RClearAll()<CR>
autocmd FileType r nnoremap <silent><buffer><A-a> :call SendAboveLinesToR()<CR>
autocmd FileType rmd nnoremap <silent><buffer><A-p> :call SendFHChunkToR()<CR>
autocmd FileType rmd nnoremap <silent><buffer><A-i> :normal! a ```{r}<CR>```<Esc>O
autocmd FileType r,rmd nnoremap <silent><buffer><C-l> :call RClearConsole()<CR>
" Remapping double character nvim-R mappings to single character
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>- :call RBrOpenCloseLs(0)<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>0 :call RObjBrowser()<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>; :call MovePosRCodeComment("normal")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>= :call RBrOpenCloseLs(1)<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>a :call :call SendFileToR("echo")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>b :call SendMBlockToR("echo", "down")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>c :call b:SendChunkToR("echo", "down")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>d :call RSetWD()<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>e :call RAction("example")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>f :call SendFunctionToR("echo", "down")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>g :call RAction("plot")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>h :call RAction("help")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>i :call RAction("print")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>k :call RKnit()<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>l :call g:SendCmdToR("ls()")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>m :set opfunc=SendMotionToR<CR>g@
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>n :call RAction("nvim.names")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>o :call SendLineToRAndInsertOutput()<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>p :call SendParagraphToR("echo", "down")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>q :call RQuit("nosave")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>r :call RAction("args")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>s :call StartR("R")<CR>:RStop<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>t :call RAction("str")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>u :call RAction("summary")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>v :call RAction("viewdf", ", location='vsplit'")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>w :call RMakeRmd("word_document")<CR>
autocmd FileType r,rmd nnoremap <silent><buffer><localleader>x :call RComment("normal")<CR>
