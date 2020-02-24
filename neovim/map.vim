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
