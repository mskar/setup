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
noremap gb :Gblame<CR>
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

if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>rg :Rgrep<CR>

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

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

" " Emacs and bash style insert mode ALT shortcuts
" " <A-b> = Move one word backward; opposite of <A-f>
set <A-b>=b
inoremap <A-b> <S-Left>
cnoremap <A-b> <S-Left>
" <A-c> = Capitalize letter and move forward
set <A-c>=c
inoremap <A-c> <Esc>l~ea
" " <A-d> = Delete word forward; opposite of <A-h> and <C-w>; https://www.reddit.com/r/vim/comments/9i58q8/question_re_delete_word_forward_in_insert_mode/e6he226/
set <A-d>=d
inoremap <expr> <A-d> col(".") == col("$") ? "<Del>" : "<C-o>de"
cnoremap <A-d> <S-Right><C-w>
" " <A-f> = Move one word forward; opposite of <A-b>
set <A-f>=f
inoremap <A-f> <S-Right>
cnoremap <A-f> <S-Right>
" " <A-h> = Delete word backward; opposite of <A-d>; same as <C-w>
set <A-h>=h
inoremap <A-h> <C-g>u<C-w>
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
inoremap <A-t> <Esc>diwbPldepa
cnoremap <A-t> <C-f>diwbPldep<C-c>
" " <A-u> = Uppercase to WORD end; opposite of <A-l>
set <A-u>=u
inoremap <A-u> <Esc>gUeea
cnoremap <A-u> <C-f>gUee<C-c>
" " <A-.> = Insert previously inserted text (if any)
set <A-.>=.
inoremap <A-.> <Esc>a<C-r>.
cnoremap <A-.> <C-r>.
" " <A--> = Undo
set <A-->=-
inoremap <A--> <Esc>ugi
" inoremap <A--> <C-o>u

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
" https://vi.stackexchange.com/questions/241/undo-only-window
nnoremap <C-w>u :source ~/session.vim<CR>

" Fuzzy finder (FZF)
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nnoremap <silent> <leader>A :Ag<CR>
nnoremap <silent> gB :BCommits<CR>
nnoremap <silent> gb :Buffers<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
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
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>T :Tags<CR>
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

nnoremap Q gqap
nmap <leader>f gwap
