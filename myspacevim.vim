function! myspacevim#after() abort
  unmap <c-c>
  unmap ,<space>
endfunction

function! myspacevim#before() abort

  nnoremap Y y$

  if !has('nvim')
    set <A-a>=a
    set <A-b>=b
    set <A-c>=c
    set <A-d>=d
    set <A-e>=e
    set <A-f>=f
    set <A-h>=h
    set <A-j>=j
    set <A-k>=k
    set <A-l>=l
    set <A-t>=t
    set <A-u>=u
    set <A-.>=.
  endif

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
  " <C-/> = Undo like in bash/emacs (this works really well)
  inoremap <C-/> <C-o>u
  " <C-=> = Redo; opposite of <C-_>
  inoremap <C-=> <C-o><C-r>

  " " Emacs and bash style insert mode ALT shortcuts
  " " <A-a> = Move to previous sentence start ; opposite of <A-e>
  nnoremap <A-a> (
  inoremap <A-a> <C-o>(
  " " <A-b> = Move one word backward; opposite of <A-f>
  nnoremap <A-b> b
  inoremap <A-b> <S-Left>
  cnoremap <A-b> <S-Left>
  " <A-c> = Capitalize letter and move forward
  nnoremap <A-c> ~w
  inoremap <A-c> <Esc>l~wi
  " " <A-d> = Delete word forward; opposite of <A-h> and <C-w>; https://www.reddit.com/r/vim/comments/9i58q8/question_re_delete_word_forward_in_insert_mode/e6he226/
  nnoremap <A-d> dw
  inoremap <expr> <A-d> col(".") == col("$") ? "<Del>" : "<C-o>de"
  cnoremap <A-d> <S-Right><C-w>
  " " <A-e> = Move to previous sentence start ; opposite of <A-a>
  nnoremap <A-e> )T.
  inoremap <A-e> <Esc>)T.i
  " " <A-f> = Move one word forward; opposite of <A-b>
  nnoremap <A-f> w
  inoremap <A-f> <S-Right>
  cnoremap <A-f> <S-Right>
  " " <A-h> = Delete word backward; opposite of <A-d>; same as <C-w>
  nnoremap <A-h> db
  inoremap <silent><expr> <A-h> "\<C-g>u<C-w>"
  cnoremap <A-h> <C-w>
  " " <A-j> = Move down; opposite of <A-k>
  inoremap <A-j> <Down>
  cnoremap <A-j> <Down>
  " " <A-k> = Move up; opposite of <A-j>
  inoremap <A-k> <Up>
  cnoremap <A-k> <Up>
  " " <A-l> = Lowercase to word end; opposite of <A-u>
  inoremap <A-l> <Esc>gueea
  cnoremap <A-l> <C-f>guee<C-c>
  " " <A-t> = Swap current word with previous word
  nnoremap <A-t> diwbPldep
  inoremap <A-t> <Esc>diwbPldepa
  cnoremap <A-t> <C-f>diwbPldep<C-c>
  " " <A-u> = Uppercase to WORD end; opposite of <A-l>
  nnoremap <A-u> gUee
  inoremap <A-u> <Esc>gUeea
  cnoremap <A-u> <C-f>gUee<C-c>
  " " <A-.> = Insert previously inserted text (if any)
  nnoremap <A-.> a<C-r>.
  inoremap <A-.> <Esc>a<C-r>.
  cnoremap <A-.> <C-r>.
endfunction

" https://github.com/liuchengxu/space-vim/issues/356
" https://github.com/liuchengxu/vim-better-default/blob/d6239473fa22429564efdd72d7e4407c6b744718/plugin/default.vim#L103-L123
" Change cursor shape for iTerm2 on macOS {
  " bar in Insert mode
  " inside iTerm2
if $TERM_PROGRAM =~# 'iTerm'
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" inside tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" inside neovim
if has('nvim')
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkon100
else
  let &t_SI.="\e[5 q" "SI = start INSERT mode
  let &t_SR.="\e[4 q" "SR = start REPLACE mode
  let &t_EI.="\e[1 q" "EI = end insert mode NORMAL mode (ELSE)
endif

" https://github.com/SpaceVim/SpaceVim/issues/470
autocmd ColorScheme molokai highlight EndOfBuffer ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight LineNr     ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight NonText ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight SignColumn ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight VertSplit ctermbg=NONE guibg=NONE

" https://vim.fandom.com/wiki/Auto-save_current_buffer_periodically
" " https://vi.stackexchange.com/a/79
if bufname("%")!=''
  au CursorHold <buffer> update
endif

" https://jovicailic.org/2017/04/vim-persistent-undo/
set undofile
if has('nvim')
  set undodir=~/.local/share/nvim/undo
else
  set undodir=~/.vim/undodir
endif


" Share system clipboard ("+) and unnamed ("") registers
" http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
" http://vimcasts.org/blog/2013/11/getting-vim-with-clipboard-support/
set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
set go+=a
