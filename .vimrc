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

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

"" Snippets
Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'

"" REPL
Plug 'jpalardy/vim-slime'

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

highlight VertSplit ctermbg=NONE guibg=NONE
set fillchars+=vert:│
set laststatus=0
highlight Normal ctermfg=white ctermbg=black

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
let g:coc_global_extensions = ['coc-bibtex', 'coc-git', 'coc-json', 'coc-python', 'coc-pairs', 'coc-r-lsp', 'coc-sh', 'coc-snippets', 'coc-tabnine', 'coc-yaml', 'coc-yank']

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
" https://vim.fandom.com/wiki/Auto-save_current_buffer_periodically
" https://vi.stackexchange.com/a/79
if bufname("%")!=''
  au CursorHold <buffer> update
endif

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Syntax highlighting for files with weird extensions
autocmd BufNewFile,BufRead .tmux.conf* set syntax=tmux
autocmd BufNewFile,BufRead *radian_profile set syntax=r
autocmd BufNewFile,BufRead *.R set ft=r
autocmd BufNewFile,BufRead *.Rmd set ft=rmd
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"*****************************************************************************
"" Mappings
"*****************************************************************************

nmap <silent><C-CR> <Plug>SlimeSendCell
nmap <silent><M-CR> <Plug>SlimeLineSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
nmap <silent><S-CR> <Plug>SlimeSendCell `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
nmap <silent><leader>c <Plug>SlimeSendCell `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
nmap <silent><leader>l <Plug>SlimeLineSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
nmap <silent><leader>m <Plug>SlimeMotionSend
nmap <silent><leader>p <Plug>SlimeParagraphSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
xmap <silent><M-CR> <Plug>SlimeRegionSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
xmap <silent><leader>c <Plug>SlimeSendCell `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
xmap <silent><leader>l <Esc><Plug>SlimeLineSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>
xmap <silent><leader>v <Plug>SlimeRegionSend `]:set nowrapscan<CR>:call search('^.\+')<CR>:set wrapscan<CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" https://github.com/vim/vim/issues/4738
nnoremap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

noremap YY "+y<CR>
noremap XX "+x<CR>

" Vim screencast #14: *Ncgn: https://youtu.be/7Bx_mLDBtRc
noremap c* *Ncgn

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
" <C-r> = make paste from register undoable in insert mode; already exists in command mode: c_ctrl-r
inoremap <silent><expr> <C-r> "\<C-g>u<C-r>"
" <C-u> = Delete to start of line; the opposite of <C-k>; already exists in command mode: c_ctrl-u
inoremap <silent><expr> <C-u> "\<C-g>u<C-u>"
" <C-w> = Delete word backward; opposite of <A-d>; same as <A-h>; already exists in command mode: c_ctrl-w
inoremap <silent><expr> <C-w> "\<C-g>u<C-w>"
" <C-y> = Paste from system clipboard (not from killring like in bash/emacs)
inoremap <C-y> <C-r>+
cnoremap <C-y> <C-r>+
" <C-_> = Undo like in bash/emacs (this works really well)
inoremap <C-_> <C-o>u
" <C-=> = Redo; opposite of <C-_>
inoremap <C-=> <C-o><C-r>

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
set <A-c>=c
nnoremap <A-c> ~w
inoremap <A-c> <Esc>l~wi
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
" " <A-k> = Move up; opposite of <A-j>
set <A-k>=k
inoremap <A-k> <Up>
cnoremap <A-k> <Up>
" " <A-l> = Lowercase to word end; opposite of <A-u>
set <A-l>=l
inoremap <A-l> <Esc>gueea
cnoremap <A-l> <C-f>guee<C-c>
" " <A-t> = Swap current word with previous word
set <A-t>=t
nnoremap <A-t> diwbPldep
inoremap <A-t> <Esc>diwbPldepa
cnoremap <A-t> <C-f>diwbPldep<C-c>
" " <A-u> = Uppercase to WORD end; opposite of <A-l>
set <A-u>=u
nnoremap <A-u> gUee
inoremap <A-u> <Esc>gUeea
cnoremap <A-u> <C-f>gUee<C-c>
" " <A-.> = Insert previously inserted text (if any)
set <A-.>=.
nnoremap <A-.> a<C-r>.
inoremap <A-.> <Esc>a<C-r>.
cnoremap <A-.> <C-r>.

"" Git
nnoremap gs :Gstatus<CR>
nnoremap d, :diffget //2<CR>
nnoremap d. :diffget //3<CR>
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
nnoremap <silent> <leader>t :terminal<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><leader> :noh<cr>

"" Open current line on GitHub
nnoremap <leader>o :.Gbrowse<CR>

nnoremap <silent> <leader>A :Ag<CR>
nnoremap <silent> <leader>b :Buffers<CR>
"Recovery commands from history through FZF
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>B :BCommits<CR>
nnoremap <silent> <leader>C :Commands<CR>
nnoremap <silent> <leader>gf :GFiles<CR>
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>H :Helptags<CR>
nnoremap <silent> <leader>M :Maps<CR>
nnoremap <silent> <leader>' :Marks<CR>
nnoremap <silent> <leader>L :Lines<CR>
nnoremap <silent> <leader>R :Rg<CR>
nnoremap <silent> <leader>z :FZF -m<CR>

" https://github.com/junegunn/fzf.vim#mappings
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>

" Run :file everytime I switch buffers
nnoremap <leader>; :bn<CR><C-g>
nnoremap <leader>, :bp<CR><C-g>
tnoremap <leader>; <C-\><C-n>:bn<CR><C-g>
tnoremap <leader>, <C-\><C-n>:bp<CR><C-g>
nnoremap ]b :bn<CR><C-g>
nnoremap [b :bp<CR><C-g>
tnoremap ]b <C-\><C-n>:bn<CR><C-g>
tnoremap [b <C-\><C-n>:bp<CR><C-g>
" Run :file everytime I switch to alternate file (^6) (not needed for vim)
" Run :file everytime I go thru the jump list (not needed for vim)
" Run :file everytime I switch windows
nnoremap <C-w>w <C-w>w<C-g>
nnoremap <C-w><C-w> <C-w>w<C-g>

" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1075
" To recover R console after pressing <C-w>o (window only), press <C-w>u (window undo)
" https://vi.stackexchange.com/questions/241/undo-only-window
nnoremap <C-w>o :mksession! ~/session.vim<CR>:wincmd o<CR><C-g>
nnoremap <C-w>c :mksession! ~/session.vim<CR>:wincmd c<CR><C-g>
" https://vi.stackexchange.com/questions/241/undo-only-window
nnoremap <C-w>u :silent :source ~/session.vim<CR>

" Fuzzy finder (FZF)
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nnoremap <silent> gB :BCommits<CR>
nnoremap <silent> gb :Buffers<CR>
nnoremap <silent> g: :History:<CR>
nnoremap <silent> g/ :History/<CR>

" Insert mode completion
" https://github.com/junegunn/fzf.vim#mappings
imap <c-x><c-a> <plug>(fzf-complete-file-ag)
imap <c-x><c-b> <plug>(fzf-complete-buffer-line)
imap <c-x><c-f> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x>a <plug>(fzf-complete-file-ag)
imap <c-x>b <plug>(fzf-complete-buffer-line)
imap <c-x>f <plug>(fzf-complete-file)
imap <c-x>l <plug>(fzf-complete-line)
imap <c-x>p <plug>(fzf-complete-path)
imap <c-x>w <plug>(fzf-complete-word)

" Mappings inspired by my .zshrc
imap <c-x><c-u> <C-o>u
imap <c-x>u <C-o>u
imap <c-x><c-x> <C-o>``
imap <c-x>x <C-o>``

" https://github.com/junegunn/fzf.vim#completion-functions
" Path completion with custom source command
inoremap <expr> <c-x><c-r> fzf#vim#complete#path('rg --files')
inoremap <expr> <c-x>r fzf#vim#complete#path('rg --files')
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('exa --only-dirs')
inoremap <expr> <c-x>d fzf#vim#complete#path('exa --only-dirs')

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

nnoremap Q gqap

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Save and run Python file and show the output
autocmd FileType python nnoremap <buffer> <silent> <leader><CR> :w !python<CR>
