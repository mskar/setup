function! myspacevim#before() abort

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
    set <A-r>=r
    set <A-S>=S
    set <A-s>=s
    set <A-t>=t
    set <A-u>=u
    set <A-.>=.
  endif

  " Window bindings
  " https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1075
  " To recover R console after pressing <C-w>o (window only), press <C-w>u (window undo)
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
  " https://vi.stackexchange.com/questions/241/undo-only-window
  nnoremap <C-w>u :silent :source ~/session.vim<CR>

  " e is easier to reach than = and is unbound
  nnoremap <C-w>e <C-w>=
  " = is easier to type than +
  nnoremap <C-w>= <C-w>+
  " , is easier to type than < and is unbound by default
  nnoremap <C-w>, <C-w><
  " . is easier to type than < and is unbound by default
  nnoremap <C-w>. <C-w>>

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
  nnoremap <A-c> gUllgueea
  inoremap <expr> <A-c> getline('.')[col('.')-1] =~ "\\s" ? "<C-o>w<C-o>gUl<C-o>l<C-o>guw<Esc>ea" : "<C-o>gUl<C-o>l<C-o>guw<Esc>ea"
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
  " " <A-k> = Delete to end of sentence
  nnoremap <A-k> df.
  inoremap <A-k> <C-o>df.
  " " <A-l> = Lowercase to word end; opposite of <A-u>
  inoremap <A-l> <C-o>gue<Esc>ea
  cnoremap <A-l> <C-f>guee<C-c>
  " " <A-t> = Swap current word with previous word
  nnoremap <A-t> diwbPldep
  inoremap <A-t> <Esc>diwbPldepa
  cnoremap <A-t> <C-f>diwbPldep<C-c>
  " " <A-u> = Uppercase to WORD end; opposite of <A-l>
  nnoremap <A-u> gUeea
  inoremap <A-u> <C-o>gUe<Esc>ea
  cnoremap <A-u> <C-f>gUee<C-c>
  " " <A-q> = Fill / Format paragraph
  nnoremap <A-q> gwip
  inoremap <A-q> <C-o>gwip
  " " <A-.> = Insert previously inserted text (if any)
  nnoremap <A-.> a<C-r>.
  inoremap <A-.> <Esc>a<C-r>.
  cnoremap <A-.> <C-r>.

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

autocmd FileType pandoc,markdown setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" https://github.com/SpaceVim/SpaceVim/issues/470
autocmd ColorScheme molokai highlight EndOfBuffer ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight LineNr     ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight NonText ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight SignColumn ctermbg=NONE guibg=NONE
autocmd ColorScheme molokai highlight VertSplit ctermbg=NONE guibg=NONE

nnoremap n nzz
nnoremap N Nzz
nnoremap Q gqap
nnoremap ZA :xa<CR>

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

autocmd VimEnter * nunmap ,<space>

