"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
" https://github.com/sheerun/vim-polyglot#troubleshooting
let g:polyglot_disabled = ['markdown']
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'tommcdo/vim-exchange'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'rkitover/vimpager'
Plug 'mskar/transwrd'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

"" Snippets
Plug 'honza/vim-snippets'

"" Color
Plug 'joshdick/onedark.vim'

"" REPL
Plug 'jpalardy/vim-slime', { 'branch': 'main' }

"" Python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" https://cirw.in/blog/bracketed-paste
Plug 'ConradIrwin/vim-bracketed-paste'

" For Rmarkdown syntax
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" From Vimcast 73: http://vimcasts.org/episodes/neovim-eyecandy/
" Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'

call plug#end()
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" Required:
filetype plugin indent on

" enable omni-completion
set omnifunc=syntaxcomplete#Complete

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

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

" https://github.com/jiangmiao/auto-pairs#shortcuts
let g:AutoPairsShortcutBackInsert = "<M-i>"
let g:AutoPairsShortcutFastWrap = "<M-w>"

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac
set nrformats=alpha,bin,unsigned
set formatoptions=croqj

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
let g:pandoc#syntax#conceal#use=0
silent! colorscheme onedark

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set title
set titleold="Terminal"
set titlestring=%F
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" https://github.com/jpalardy/vim-slime#tmux
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
let g:slime_cell_delimiter = "# %%"
" Remove all vim slime mappings (remapped below)
let g:slime_no_mappings = 1

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

" Remove all vim surround mappings (remapped below)
let g:surround_no_mappings = 1

" vim-pandoc inserts citations with <C-x><C-o>
" disable automatic folding by vim-pandoc
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#blacklist = ["codeblock_start", "codeblock_delim"]
" In addition to vim-pandoc, zotcite and nvim-r can insert citations
" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1940"

set completeopt=longest,menuone

" http://vimdoc.sourceforge.net/htmldoc/options.html#'autowrite'
set autowrite

" https://jovicailic.org/2017/04/vim-persistent-undo/
set undofile
set undodir=~/.vim/undodir

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=10

"" Directories for swp files
set nobackup
set noswapfile
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" (In times of great desperation) allow use of the mouse
set mouse=a

" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI.="\e[5 q" "SI = start INSERT mode
let &t_SR.="\e[4 q" "SR = start REPLACE mode
let &t_EI.="\e[1 q" "EI = end insert mode NORMAL mode (ELSE)

" Share system clipboard ("+) and unnamed ("") registers
" http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
" http://vimcasts.org/blog/2013/11/getting-vim-with-clipboard-support/
set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
set go+=a

" Include some of the neovim defaults, others below
set autoindent
set background=dark
set belloff=all
set nocompatible
set complete=.,w,b,u,t
set cscopeverbose
set history=10000
set showcmd " Show partially typed commands in the statusline
set sidescroll=1
set smarttab
set tabpagemax=50
set wildmenu " Display all matching files when we tab complete

" Neovim defaults?
set path+=** " Provides tab-completion for all file-related tasks
set lazyredraw " Don't redraw while executing macros (good performance config)
set showmatch " Show matching brackets when text indicator is over them
set hidden " can put buffer to the background without writing to disk, will remember history/marks.

set fillchars+=vert:│
set laststatus=0
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight Normal ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE
highlight pandocEmphasis gui=italic cterm=italic guifg=#ffff00 ctermfg=Yellow
highlight pandocString guifg=#00ff00 ctermfg=Green
highlight pandocNoFormatted guifg=#ff8700 ctermfg=214

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_OPTS="'--bind=change:top,ctrl-/:toggle-preview,ctrl-n:down,ctrl-p:up,ctrl-k:kill-line,alt-p:toggle-preview,alt-w:toggle-preview-wrap,alt-y:execute-silent(echo {1} | pbcopy)' --cycle --delimiter=':, ' --exit-0 --inline-info --multi --no-height --no-sort --preview='bat --style=numbers --color=always {1}' --preview-window='70%:hidden' --reverse --tiebreak=index"

" Disable visualbell
set noerrorbells visualbell t_vb=

" CamelCaseWord
" let g:camelchar = "A-Z"
" Also stop on numbers.
" let g:camelchar = "A-Z0-9"
" Include '.' for class member, ',' for separator, ';' end-statement, " and <[< bracket starts and "'` quotes.
let g:camelchar = "A-Z0-9.,;:{([`'\""
" COC settings
" https://github.com/neoclide/coc.nvim/blob/82c3834f8bfc5d91ce907405722fe0f297e13cff/doc/coc.txt#L1202
let g:coc_global_extensions = ['coc-bibtex', 'coc-git', 'coc-json', 'coc-python', 'coc-r-lsp', 'coc-sh', 'coc-snippets', 'coc-tabnine', 'coc-yaml', 'coc-yank']

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" grep.vim
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

set autoread

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" No one is really happy until you have this shortcuts
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

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" https://vimways.org/2018/formatting-lists-with-vim/
autocmd FileType pandoc,markdown,text setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 formatoptions+=tnp formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:

" Syntax highlighting for files with weird extensions
autocmd BufNewFile,BufRead .tmux.conf* set syntax=tmux
autocmd BufNewFile,BufRead *radian_profile set syntax=r
autocmd BufNewFile,BufRead *.R set ft=r
autocmd BufNewFile,BufRead shortcuts.jupyterlab-settings set syntax=json

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

"*****************************************************************************
"" Mappings
"*****************************************************************************

nmap <silent><C-CR> <Plug>SlimeSendCell
nmap <silent><M-CR> <Plug>SlimeLineSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
nmap <silent><S-CR> <Plug>SlimeSendCell `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
" nmap <silent><leader>c <Plug>SlimeSendCell `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
" nmap <silent><leader>l <Plug>SlimeLineSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
" nmap <silent><leader>m <Plug>SlimeMotionSend
nnoremap <silent><leader>p :Page<CR>
xmap <silent><M-CR> <Plug>SlimeRegionSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
" xmap <silent><leader>c <Plug>SlimeSendCell `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
" xmap <silent><leader>l <Esc><Plug>SlimeLineSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
xmap <silent><leader>v <Plug>SlimeRegionSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" https://github.com/vim/vim/issues/4738
nnoremap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

" unimpaired style mapping for toggling autoformat
nnoremap <expr> yoa &fo =~ 'a' ? ':set fo-=a<CR>' : ':set fo+=a<CR>'

if has('macunix')
  " pbcopy for OSX copy/paste
  xmap <D-x> :!pbcopy<CR>
  xmap <D-c> :w !pbcopy<CR><CR>
endif

"" Vmap for maintain Visual Mode after shifting > and <
xmap < <gv
xmap > >gv

"" Move visual block
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

" https://vi.stackexchange.com/a/22233
" copied from plugin/surround.vim
nmap  ds   <Plug>Dsurround
nmap  cs   <Plug>Csurround
nmap  cS   <Plug>CSurround
nmap  ys   <Plug>Ysurround
nmap  yS   <Plug>YSurround
nmap  yss  <Plug>Yssurround
nmap  ySs  <Plug>YSsurround
nmap  ySS  <Plug>YSsurround
xmap  S    <Plug>VSurround
xmap  gS   <Plug>VgSurround
imap <C-S> <Plug>Isurround
" ----- remove these -----
" imap    <C-G>s <Plug>Isurround
" imap    <C-G>S <Plug>ISurround

" Emacs and bash style insert mode CTRL shortcuts
" <C-a> = Move to start of the line; like in vim command mode: c_ctrl-b; To insert previously inserted text, use <C-r>. or <Alt-.> (below)
inoremap <C-a> <Home>
cnoremap <C-a> <Home>
" <C-b> = Move one character backward; the opposite of <C-f>
inoremap <C-b> <Left>
cnoremap <C-b> <Left>
" <C-d> = Delete one character forward; the opposite of <C-h>
inoremap <silent><expr> <C-d> "\<C-g>u<Delete>"
cnoremap <C-d> <Delete>
" <C-e> = Move to end of the line (already exists in command mode: c_ctrl-e), this also cancels completion
inoremap <C-e> <End>
" <C-f> = Move one character forward; the opposite of <C-b>; <C-f> is too useful (for : / ?) to remap
inoremap <C-f> <Right>
" <C-g> = Cancel completion
inoremap <silent><expr> <C-g> pumvisible() ? "\<C-e>" :  "<C-g>"
" <C-h> = Delete one character backward; the opposite of <C-d>; already exists in command mode: c_ctrl-h
inoremap <silent><expr> <C-h> "\<C-g>u<BS>"
" <C-k> = Delete to end of line; the opposite of <C-u>; https://www.reddit.com/r/vim/comments/9i58q8/question_re_delete_word_forward_in_insert_mode/e6he226/; https://superuser.com/a/855997
inoremap <expr> <C-k> col(".") == col("$") ? "<Del>" : "<C-o>d$"
cnoremap <C-k> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
" cnoremap <C-k> <C-f>d$<C-c><End>
" <C-r> = make paste from register undoable in insert mode; already exists in command mode: c_ctrl-r
inoremap <silent><expr> <C-r> "\<C-g>u<C-r>"
" <C-u> = Delete to start of line; the opposite of <C-k>; already exists in command mode: c_ctrl-u
inoremap <silent><expr> <C-u> "\<C-g>u<C-u>"
" <C-w> = Delete word backward; opposite of <A-d>; same as <A-h>; already exists in command mode: c_ctrl-w
inoremap <silent><expr> <C-w> "\<C-g>u<C-w>"
" <C-y> = Paste from system clipboard (not from killring like in bash/emacs)
inoremap <silent> <C-y> <C-o>:call <SID>ResetKillRing()<CR><C-r><C-o>"
cnoremap <C-y> <C-r><C-o>"
" <C-_> = Undo like in bash/emacs (this works really well)
inoremap <C-_> <C-o>u
inoremap <C-x><C-u> <C-o>u
" <C-/> = Undo like in bash/emacs (this works really well)
inoremap <C-/> <C-o>u
" <C-=> = Redo; opposite of <C-_>
inoremap <C-=> <C-o><C-r>
" Vimacs
imap <C-@> <C-Space>
inoremap <C-<> <C-o>:call <SID>StartMarkSel()<CR><C-o>v1G0o
inoremap <C->> <C-o>:call <SID>StartMarkSel()<CR><C-o>vG$o
inoremap <C-M-%> <C-o>:call <SID>QueryReplaceRegexp()<CR>
inoremap <C-M-/> <C-x>
inoremap <C-M-o> <C-o>:echoerr "<C-M-o> not supported yet; sorry!"<CR>
inoremap <C-M-r> <C-o>:call <SID>StartSearch('?')<CR><C-o>?
inoremap <C-M-s> <C-o>:call <SID>StartSearch('/')<CR><C-o>/
inoremap <C-M-x> <C-x>
inoremap <C-S-Tab> <C-o><C-w>W
inoremap <C-Tab> <C-o><C-w>w
inoremap <C-]> <C-x>
inoremap <C-s> <C-o>:call <SID>StartSearch('/')<CR><C-o>/
inoremap <C-t> <Left><C-o>x<C-o>p
inoremap <C-v> <PageDown>
inoremap <C-x>+ <C-o><C-w>=
inoremap <C-x>/ <C-o>:call <SID>PointToRegister()<CR>
inoremap <C-x>0 <C-o><C-w>c
inoremap <C-x>1 <C-o><C-w>o
inoremap <C-x>2 <C-o><C-w>s
inoremap <C-x>3 <C-o><C-w>v
inoremap <C-x>4<C-f> <C-o>:FindFileOtherWindow<Space>
inoremap <C-x>4f <C-o>:FindFileOtherWindow<Space>
inoremap <C-x><BS> <C-o>d(
inoremap <C-x><C-b> <C-o>:buffers<CR>
inoremap <C-x><C-c> <C-o>:confirm qall<CR>
inoremap <C-x><C-f> <C-o>:hide edit<Space>
inoremap <C-x><C-o> <C-o>:call <SID>DeleteBlankLines()<CR>
inoremap <C-x><C-q> <C-o>:set invreadonly<CR>
inoremap <C-x><C-r> <C-o>:hide view<Space>
inoremap <C-x><C-s> <C-o>:update<CR>
inoremap <C-x><C-t> <Up><C-o>dd<End><C-o>p<Down>
inoremap <C-x><C-w> <C-o>:write<Space>
inoremap <C-x>= <C-g>
inoremap <C-x>O <C-o><C-w>W
inoremap <C-x>h <C-o>:call <SID>StartMarkSel()<CR><Esc>1G0vGo
inoremap <C-x>i <C-o>:read<Space>
inoremap <C-x>k <C-o>:bdelete<Space>
inoremap <C-x>o <C-o><C-w>w
inoremap <C-x>p <C-o><C-o>
inoremap <C-x>r<C-@> <C-o>:call <SID>PointToRegister()<CR>
inoremap <C-x>r<C-Space> <C-o>:call <SID>PointToRegister()<CR>
inoremap <C-x>r<Space> <C-o>:call <SID>PointToRegister()<CR>
inoremap <C-x>rj <C-o>:call <SID>JumpToRegister()<CR>
inoremap <C-x>s <C-o>:wall<CR>
inoremap <script> <C-o> <CR><Left>
inoremap <silent> <C-M-v> <C-o>:ScrollOtherWindow<CR>
inoremap <silent> <C-Space> <C-r>=<SID>StartVisualMode()<CR>
vnoremap <C-M-\> =
vnoremap <C-g> <Esc>
vnoremap <C-w> "1d
vnoremap <C-x><C-@> <Esc>
vnoremap <C-x><C-Space> <Esc>
vnoremap <C-x><Tab> =

" " Emacs and bash style insert mode ALT shortcuts
" " <A-a> = Move to previous sentence start ; opposite of <A-e>
set <A-a>=a
nnoremap <A-a> (
inoremap <A-a> <C-o>(
" " <A-b> = Move one word backward; opposite of <A-f>
set <A-b>=b
nnoremap <A-b> b
inoremap <A-b> <S-Left>
cnoremap <A-b> <S-Left>
" <A-c> = Capitalize letter and move forward
" https://github.com/andrep/vimacs/blob/master/plugin/vimacs.vim#L1229
set <A-c>=c
nnoremap <A-c> gUllgueea
inoremap <expr> <A-c> getline('.')[col('.')-1] =~ "\\s" ? "<C-o>W<C-o>gUl<C-o>l<C-o>guw<Esc>ea" : "<C-o>gUl<C-o>l<C-o>guw<Esc>ea"
" " <A-d> = Delete word forward; opposite of <A-h> and <C-w>; https://www.reddit.com/r/vim/comments/9i58q8/question_re_delete_word_forward_in_insert_mode/e6he226/
set <A-d>=d
nnoremap <A-d> dw
inoremap <expr> <A-d> col(".") == col("$") ? "<Del>" : "<C-o>de"
cnoremap <A-d> <S-Right><C-w>
" " <A-e> = Move to previous sentence start ; opposite of <A-a>
set <A-e>=e
nnoremap <A-e> )T.
inoremap <A-e> <Esc>)T.i
" " <A-f> = Move one word forward; opposite of <A-b>
set <A-f>=f
nnoremap <A-f> w
inoremap <A-f> <S-Right>
cnoremap <A-f> <S-Right>
" " <A-h> = Delete word backward; opposite of <A-d>; same as <C-w>
set <A-h>=h
nnoremap <A-h> db
inoremap <silent><expr> <A-h> "\<C-g>u<C-w>"
cnoremap <A-h> <C-w>
" " <A-j> = Move down; opposite of <A-k>
set <A-j>=j
inoremap <A-j> <Down>
cnoremap <A-j> <Down>
" " <A-k> = Delete to end of sentence
set <A-k>=k
nnoremap <A-k> df.
inoremap <A-k> <C-o>df.
" " <A-l> = Lowercase to word end; opposite of <A-u>
" https://github.com/andrep/vimacs/blob/master/plugin/vimacs.vim#L1229
set <A-l>=l
inoremap <A-l> <C-o>gue<Esc>ea
cnoremap <A-l> <C-f>guee<C-c>
" " <A-u> = Uppercase to word end; opposite of <A-l>
" https://github.com/andrep/vimacs/blob/master/plugin/vimacs.vim#L1229
set <A-u>=u
nnoremap <A-u> gUeea
inoremap <A-u> <C-o>gUe<Esc>ea
cnoremap <A-u> <C-f>gUee<C-c>
" " <A-q> = Fill / Format paragraph
set <A-q>=q
nnoremap <A-q> gwip
inoremap <A-q> <C-o>gwip
" " <A-.> = Insert Previously Inserted text (if any)
set <A-.>=.
nnoremap <A-.> a<C-r>.
inoremap <A-.> <Esc>a<C-r>.
cnoremap <A-.> <C-r>.
" Vimacs
inoremap <C-x>4. <C-o><C-w>}
inoremap <M-!> <C-o>:!
inoremap <M-%> <C-o>:call <SID>QueryReplace()<CR>
inoremap <M-*> <C-o><C-t>
inoremap <M-.> <C-o><C-]>
inoremap <M-/> <C-p>
inoremap <M-0><C-k> <C-o>d0
inoremap <M-1> <C-o>1
inoremap <M-2> <C-o>2
inoremap <M-3> <C-o>3
inoremap <M-4> <C-o>4
inoremap <M-5> <C-o>5
inoremap <M-6> <C-o>6
inoremap <M-7> <C-o>7
inoremap <M-8> <C-o>8
inoremap <M-9> <C-o>9
inoremap <M-:> <C-o>:
inoremap <M-<> <C-o>1G<C-o>0
inoremap <M->> <C-o>G<C-o>$
inoremap <M-Space> <C-o>:call <SID>StartMarkSel()<CR><C-o>viw
inoremap <M-\> <Esc>beldwi
inoremap <M-^> <Up><End><C-o>J
inoremap <M-`> <C-o>
inoremap <M-h> <C-o>:call <SID>StartMarkSel()<CR><C-o>vapo
inoremap <M-k> <C-o>d)
inoremap <M-m> <C-o>^
inoremap <M-n> <C-o>:cnext<CR>
inoremap <M-p> <C-o>:cprevious<CR>
inoremap <M-r> <C-r>=
inoremap <M-s> <C-o>:set invhls<CR>
inoremap <M-v> <PageUp>
inoremap <M-x> <C-o>:
inoremap <M-y> <C-o>:call <SID>YankPop()<CR>
inoremap <M-z> <C-o>dt
inoremap <silent> <M-g> <C-o>:call <SID>GotoLine()<CR>
inoremap <silent> <M-q> <C-o>:call <SID>FillParagraph()<CR>
vnoremap <M-!> !
vnoremap <M-h> o}o
vnoremap <M-w> "1y
vnoremap <M-x> :

"" Git
nnoremap gs :Gstatus<CR>
nnoremap [g :diffget //2<CR>
nnoremap ]g :diffget //3<CR>
nnoremap <silent><leader>gw :Gwrite<CR>
nnoremap <silent><leader>gc :Gwrite<bar>Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gu :Gpull<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gr :Gremove<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gg :Gwrite<CR>:Gcommit -m "edit "%<CR>:Gpush<CR>

" https://github.com/neoclide/coc-git
" https://github.com/neoclide/coc-yank
" navigate chunks of current buffer
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show git log at current position
nmap gl <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
" add and reset
nmap <silent> <leader>d :CocCommand git.diffCached<CR>
nmap <silent> ga :CocCommand git.chunkStage<CR>
nmap <silent> gr :CocCommand git.chunkUndo<CR>
nmap <silent> yog :CocCommand git.toggleGutters<CR>
" yank
nmap <silent> gy :CocCommand git.copyUrl<CR>
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" terminal emulation
" nnoremap <silent> <leader>t :terminal<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><leader> :noh<cr>

"" Open current line on GitHub
nnoremap <leader>o :.Gbrowse<CR>


" Symbol renaming.
" nmap <leader>r <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>

" Run :file everytime I switch buffers
nnoremap <leader>; :silent bn<CR>:file<CR>
nnoremap <leader>, :bp<CR>:file<CR>
tnoremap <leader>; <C-\><C-n>:bn<CR>:file<CR>
tnoremap <leader>, <C-\><C-n>:bp<CR>:file<CR>
nnoremap ]b :silent bn<CR>:file<CR>
nnoremap [b :silent bp<CR>:file<CR>
tnoremap ]b <C-\><C-n>:bn<CR>:file<CR>
tnoremap [b <C-\><C-n>:bp<CR>:file<CR>
" Run :file everytime I switch to alternate file (^6) (not needed for vim)
" Run :file everytime I go thru the jump list (not needed for vim)
" Run :file everytime I switch windows
nnoremap <C-w>w <C-w>w:file<CR>
nnoremap <C-w><C-w> <C-w>w:file<CR>
nnoremap <C-o> <C-o>:file<CR>
nnoremap <C-i> <C-i>:file<CR>
" Run :file everytime I switch windows (not needed in nvim)

" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1075
" To recover R console after pressing <C-w>c / <C-w>o/<C-w>q
" https://vi.stackexchange.com/questions/241/undo-only-window
function! Zoom()
  if winbufnr(2) == -1 " https://stackoverflow.com/a/7070691
    wa | source ~/session.vim
  else
    mksession! ~/session.vim | wincmd o
  endif
endfunction

nnoremap <C-w>o :call Zoom()<CR>
nnoremap <C-w>c :mksession! ~/session.vim<CR>:wincmd c<CR>:file<CR>
nnoremap <C-w>q :mksession! ~/session.vim<CR>:wincmd q<CR>:file<CR>
nnoremap <C-w>u :silent :source ~/session.vim<CR>

" e is easier to reach than = and is unbound by default
nnoremap <C-w>e <C-w>=

" Fuzzy finder (FZF)
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nnoremap <silent> gB :BCommits<CR>
nnoremap <silent> gb :Buffers<CR>
nnoremap <silent> g: :History:<CR>
nnoremap <silent> g/ :History/<CR>

" Insert mode completion
" https://github.com/junegunn/fzf.vim#mappings
imap <C-x><C-a> <plug>(fzf-complete-file-ag)
imap <C-x><C-b> <plug>(fzf-complete-buffer-line)
imap <C-x><C-f> <plug>(fzf-complete-file)
imap <C-x><C-l> <plug>(fzf-complete-line)
imap <C-x><C-d> <plug>(fzf-complete-path)
imap <C-x><C-w> <plug>(fzf-complete-word)
imap <C-x>a <plug>(fzf-complete-file-ag)
imap <C-x>b <plug>(fzf-complete-buffer-line)
imap <C-x>f <plug>(fzf-complete-file)
imap <C-x>l <plug>(fzf-complete-line)
imap <C-x>d <plug>(fzf-complete-path)
imap <C-x>w <plug>(fzf-complete-word)

" Use <C-x><C-o> to activate vim omnicompletion
iunmap <C-x><C-o>

" https://github.com/junegunn/fzf.vim/issues/865
" https://github.com/junegunn/fzf.vim/issues/10
" TODO a for :args
" TODO c for :changes
" TODO j for :jumps
" TODO p for put into register
" TODO P for append to register
" TODO y for yank from register
" TODO @ for execute macro from registers
nnoremap <silent> <leader>' :Marks!<CR>
nnoremap <silent> <leader>/ :History/!<CR>
nnoremap <silent> <leader>: :History:!<CR>
nnoremap <silent> <leader>? :Helptags!<CR>
nnoremap <silent> <leader>a :Ag!<CR>
nnoremap <silent> <leader>b :Buffers!<CR>
nnoremap <silent> <leader>c :Commits!<CR>
nnoremap <silent> <leader>C :BCommits!<CR>
nnoremap <silent> <leader>f :Files!<CR>
nnoremap <silent> <leader>F :Filetypes!<CR>
nnoremap <silent> <leader>gf :GFiles!<CR>
nnoremap <silent> <leader>h :History!<CR>
nnoremap <silent> <leader>l :Lines!<CR>
nnoremap <silent> <leader>L :BLines!<CR>
nnoremap <silent> <leader>m :Maps!<CR>
nnoremap <silent> <leader>r :Rg!<CR>
nnoremap <silent> <leader>s :Snippets!<CR>
nnoremap <silent> <leader>t :Tags!<CR>
nnoremap <silent> <leader>T :BTags!<CR>
nnoremap <silent> <leader>w :Windows!<CR>
nnoremap <silent> <leader>x :Commands!<CR>
nnoremap <silent> <leader>z :FZF! -m<CR>

" https://github.com/junegunn/fzf.vim#mappings
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" https://github.com/junegunn/fzf.vim#completion-functions
" Path completion with custom source command
inoremap <expr> <c-x><c-r> fzf#vim#complete#path('rg --files')
inoremap <expr> <c-x>r fzf#vim#complete#path('rg --files')
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('exa --only-dirs')
inoremap <expr> <c-x>d fzf#vim#complete#path('exa --only-dirs')

" Mappings inspired by my .zshrc
imap <c-x><c-u> <C-o>u
imap <c-x>u <C-o>u
imap <c-x><c-x> <C-o>``
imap <c-x>x <C-o>``

" https://vim.fandom.com/wiki/Moving_through_camel_case_words
" Stop on capital letters.
" CamelCaseWord shortcuts will not work in vim (no way to send alt+ctrl)

" Map <tab> for trigger completion, completion confirm, snippet expand and jump like VSCode.
" Note: the `coc-snippets` extension is required for this to work.
" https://github.com/neoclide/coc.nvim/blob/2ee86b914fc047b81fd61bd2156e062a9c0d5533/doc/coc.txt#L910
inoremap <silent><expr> <TAB>
  \ len(complete_info()["items"]) == 1 ? "\<C-y>" :
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

inoremap <silent><expr> <CR>
  \ len(complete_info()["items"]) == 1 ? "\<C-y>" :
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<CR>" :
  \ "\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap n nzz
nnoremap N Nzz
nnoremap Q gqap
nnoremap ZA :xa<CR>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

nnoremap Y y$

set <A-s>=s
set <A-S>=S

" 2-character Sneak (default)
nmap <A-s>   <Plug>Sneak_s
nmap <A-S> <Plug>Sneak_S
" visual-mode
xmap <A-s>   <Plug>Sneak_s
xmap <A-S> <Plug>Sneak_S
" operator-pending-mode
omap <A-s>   <Plug>Sneak_s
omap <A-S> <Plug>Sneak_S

" repeat motion
map ; <Plug>Sneak_;
map , <Plug>Sneak_,

" 1-character enhanced 'f'
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
" visual-mode
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
" operator-pending-mode
" omap f <Plug>Sneak_f
" omap F <Plug>Sneak_F

" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
" visual-mode
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
" operator-pending-mode
" omap t <Plug>Sneak_t
" omap T <Plug>Sneak_T

" https://vimrcfu.com/snippet/250
" https://vi.stackexchange.com/a/15785
function! ToggleHML()
    set scrolloff=0
    let l:last_win_line = ( line('$') <= winheight('%') ? line('$')  : winheight('%')  )
    if winline() == l:last_win_line / 2
      normal H
    elseif winline() == l:last_win_line
      normal M
    elseif winline() == 1
      normal L
    else
      normal M
    endif
endfunction

function! Toggleztzzzb()
    set scrolloff=0
    let l:last_win_line = ( line('$') <= winheight('%') ? line('$')  : winheight('%')  )
    if winline() == l:last_win_line / 2
      normal zt
    elseif winline() == l:last_win_line
      normal zz
    elseif winline() == 1
      normal zb
    else
      normal zz
    endif
endfunction

function! PutNumbers(...)
    let start     = get(a:, 1, 1)
    let stop      = get(a:, 2, 10)
    let format    = get(a:, 3, "%02d. \n")
    let delimiter = get(a:, 4, '')
    let prefix    = get(a:, 5, '')
    let suffix    = get(a:, 6, '')
    put=prefix.join(map(range(start,stop), 'printf(format, v:val)'), delimiter).suffix
endfunction

nnoremap <C-l> :call Toggleztzzzb()<CR>
nnoremap <M-r> :call ToggleHML()<CR>
inoremap <C-l> <C-o>:call Toggleztzzzb()<CR>
inoremap <M-r> <C-o>:call ToggleHML()<CR>

" https://github.com/SpaceVim/SpaceVim/issues/2260#issuecomment-482814306
" https://www.vim.org/scripts/script.php?script_id=300

function! <SID>LetDefault(var_name, value)
  if !exists(a:var_name)
    execute 'let ' . a:var_name . '=' . a:value
  endif
endfunction

function! <SID>Mark(...)
  if a:0 == 0
    let mark = line(".") . "G" . virtcol(".") . "|"
    normal! H
    let mark = "normal!" . line(".") . "Gzt" . mark
    execute mark
    return mark
  elseif a:0 == 1
    return "normal!" . a:1 . "G1|"
  else
    return "normal!" . a:1 . "G" . a:2 . "|"
  endif
endfun

function! <SID>StartSearch(search_dir)
  let s:incsearch_status = &incsearch
  let s:lazyredraw_status = &lazyredraw
  set incsearch
  cmap <C-c> <CR>
  cnoremap <C-s> <C-c><C-o>:call <SID>SearchAgain()<CR><C-o>/<Up>
  cnoremap <C-r> <C-c><C-o>:call <SID>SearchAgain()<CR><C-o>?<Up>
  cnoremap <silent> <CR> <CR><C-o>:call <SID>StopSearch()<CR>
  cnoremap <silent> <C-g> <C-c><C-o>:call <SID>AbortSearch()<CR>
  cnoremap <silent> <Esc> <C-c><C-o>:call <SID>AbortSearch()<CR>
  if a:search_dir == '/'
    cnoremap <M-s> <CR><C-o>:set invhls<CR><Left><C-o>/<Up>
  else
    cnoremap <M-s> <CR><C-o>:set invhls<CR><Left><C-o>?<Up>
  endif
  let s:before_search_mark = <SID>Mark()
endfunction

function! <SID>StopSearch()
  cunmap <C-c>
  cunmap <C-s>
  cunmap <C-r>
  cunmap <CR>
  cunmap <C-g>
  cnoremap <C-g> <C-c>
  if exists("s:incsearch_status")
    let &incsearch = s:incsearch_status
    unlet s:incsearch_status
  endif
  if g:VM_SearchRepeatHighlight == 1
    if exists("s:hls_status")
      let &hls = s:hls_status
      unlet s:hls_status
    endif
  endif
endfunction

function! <SID>AbortSearch()
  call <SID>StopSearch()
  if exists("s:before_search_mark")
    execute s:before_search_mark
    unlet s:before_search_mark
  endif
endfunction

function! <SID>SearchAgain()
  if (winline() <= 2)
    normal zb
  elseif (( winheight(0) - winline() ) <= 2)
    normal zt
  endif
  cnoremap <C-s> <CR><C-o>:call <SID>SearchAgain()<CR><C-o>/<Up>
  cnoremap <C-r> <CR><C-o>:call <SID>SearchAgain()<CR><C-o>?<Up>
  if g:VM_SearchRepeatHighlight == 1
    if !exists("s:hls_status")
      let s:hls_status = &hls
    endif
    set hls
  endif
endfunction

" Emacs' `query-replace' functions

function! <SID>QueryReplace()
  let magic_status = &magic
  set nomagic
  let searchtext = input("Query replace: ")
  if searchtext == ""
    echo "(no text entered): exiting to Insert mode"
    return
  endif
  let replacetext = input("Query replace " . searchtext . " with: ")
  let searchtext_esc = escape(searchtext,'/\^$')
  let replacetext_esc = escape(replacetext,'/\')
  execute ".,$s/" . searchtext_esc . "/" . replacetext_esc . "/cg"
  let &magic = magic_status
endfunction

function! <SID>QueryReplaceRegexp()
  let searchtext = input("Query replace regexp: ")
  if searchtext == ""
    echo "(no text entered): exiting to Insert mode"
    return
  endif
  let replacetext = input("Query replace regexp " . searchtext . " with: ")
  let searchtext_esc = escape(searchtext,'/')
  let replacetext_esc = escape(replacetext,'/')
  execute ".,$s/" . searchtext_esc . "/" . replacetext_esc . "/cg"
endfunction

command! QueryReplace :call <SID>QueryReplace()<CR>
command! QueryReplaceRegexp :call <SID>QueryReplaceRegexp()<CR>

function! <SID>GotoLine()
  let targetline = input("Goto line: ")
  if targetline =~ "^\\d\\+$"
    execute "normal! " . targetline . "G0"
  elseif targetline =~ "^\\d\\+%$"
    execute "normal! " . targetline . "%"
  elseif targetline == ""
    echo "(cancelled)"
  else
    echo " <- Not a Number"
  endif
endfunction

command! GotoLine :call <SID>GotoLine()

function! <SID>YankPop()
  undo
  if !exists("s:kill_ring_position")
    call <SID>ResetKillRing()
  endif
  execute "normal! i\<C-r>\<C-o>" . s:kill_ring_position . "\<Esc>"
  call <SID>IncrKillRing()
endfunction

function! <SID>ResetKillRing()
  let s:kill_ring_position = 3
endfunction

function! <SID>IncrKillRing()
  if s:kill_ring_position >= 9
    let s:kill_ring_position = 2
  else
    let s:kill_ring_position = s:kill_ring_position + 1
  endif
endfunction

function! <SID>StartMarkSel()
  if &selectmode =~ 'key'
    set keymodel-=stopsel
  endif
endfunction

function! <SID>StartVisualMode()
  call <SID>StartMarkSel()
  if col('.') > strlen(getline('.'))
    " At EOL
    return "\<Right>\<C-o>v\<Left>"
  else
    return "\<C-o>v"
  endif
endfunction

function! <SID>number_of_windows()
  let i = 1
  while winbufnr(i) != -1
    let i = i + 1
  endwhile
  return i - 1
endfunction

function! <SID>FindFileOtherWindow(filename)
  let num_windows = <SID>number_of_windows()
  if num_windows <= 1
    wincmd s
  endif
  wincmd w
  execute "edit " . a:filename
  wincmd W
endfunction

command! -nargs=1 -complete=file FindFileOtherWindow :call <SID>FindFileOtherWindow(<f-args>)

command! ScrollOtherWindow silent! execute "normal! \<C-w>w\<PageDown>\<C-w>W"

command! FillParagraph :call <SID>FillParagraph()

function! <SID>FillParagraph()
  let old_cursor_pos = <SID>Mark()
  normal! gqip
  execute old_cursor_pos
endfunction

function! <SID>DeleteBlankLines()
  if getline(".") == "" || getline(". + 1") == "" || getline(". - 1") == ""
    ?^.\+$?+1,/^.\+$/-2d"_"
  endif
  normal j
endfunction

command! PointToRegister :call PointToRegister()
command! JumpToRegister :call JumpToRegister()

function! <SID>PointToRegister()
  echo "Point to mark: "
  let c = nr2char(getchar())
  execute "normal! m" . c
endfunction

function! <SID>JumpToRegister()
  echo "Jump to mark: "
  let c = nr2char(getchar())
  execute "normal! `" . c
endfunction

" This part needs to be viewed raw on GitHub
set <M-1>=1
set <M-2>=2
set <M-3>=3
set <M-4>=4
set <M-5>=5
set <M-6>=6
set <M-7>=7
set <M-8>=8
set <M-9>=9
set <M-0>=0
set <M-a>=a
set <M-b>=b
set <M-c>=c
set <M-d>=d
set <M-e>=e
set <M-f>=f
set <M-g>=g
set <M-h>=h
set <M-i>=i
set <M-j>=j
set <M-k>=k
set <M-l>=l
set <M-m>=m
set <M-n>=n
set <M-o>=o
set <M-p>=p
set <M-q>=q
set <M-r>=r
set <M-s>=s
set <M-t>=t
set <M-u>=u
set <M-v>=v
set <M-w>=w
set <M-x>=x
set <M-y>=y
set <M-z>=z
set <M->=
set <M-/>=/
set <Char-190>=>
set <Char-188>=<
set <M-<>=<
set <M-0>=0
set <M-%>=%
set <M-*>=*
set <M-.>=.
set <M-^>=^

set sel=exclusive
