" Fuzzy finder (FZF)
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nnoremap <silent> <leader>A :Ag<CR>
nnoremap <silent> <leader>B :BCommits<CR>
nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>C :Commands<CR>
nnoremap <silent> <leader>gf :GFiles<CR>
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>H :Helptags<CR>
nnoremap <silent> <leader>: :History:<CR>
nnoremap <silent> <leader>/ :History/<CR>
nnoremap <silent> g: :History:<CR>
nnoremap <silent> g/ :History/<CR>
nnoremap <silent> <leader>m :Maps<CR>
nnoremap <silent> <leader>' :Marks<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>L :Lines<CR>
" s is for syntax
nnoremap <silent> <leader>R :Rg<CR>
nnoremap <silent> <leader>y :Filetypes<CR>
nnoremap <silent> <Leader>t :BTags<CR>
nnoremap <silent> <Leader>T :Tags<CR>

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

" ncm-R: https://github.com/gaalcaras/ncm-R
" requires the lines below to satisfy ncm2 dependencies
" https://github.com/ncm2/ncm2#install
" https://github.com/gaalcaras/ncm-R/blob/master/test/min_vimrc#L16
set completeopt=noinsert,menuone,noselect
autocmd BufEnter * call ncm2#enable_for_buffer()
" For now, use coc in vim and ncm in neovim
" Later, try to use ncm just for r/rmd files as below
" autocmd BufEnter *.[Rr],*.Rmd call ncm2#enable_for_buffer()
" or switch to coc entirely if the R LSP gets better
" https://github.com/REditorSupport/languageserver/issues/167

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
" https://github.com/ncm2/ncm2-ultisnips
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

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

inoremap <silent> <expr> <Tab> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_try_expand)")

inoremap <silent> <Plug>(ultisnips_try_expand) <C-R>=UltiSnipsExpandOrJumpOrTab()<CR>

snoremap <silent> <Tab> <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>

" https://github.com/neovim/neovim/issues/1822#issuecomment-233152833
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" Emacs and bash style insert mode shortcuts
" Delete one character forward; the opposite of <C-h>
inoremap <C-d> <Delete>
cnoremap <C-d> <Delete>
" Delete everything forward; the opposite of <C-u>
" Can't find a way to do this in command mode
inoremap <C-k> <C-o>D
" Move to end of the line; already exists in command mode: c_ctrl-e
inoremap <C-e> <End>
" Move to start of the line; like in vim command mode: c_ctrl-b
" To insert previously inserted text use <C-r>.
inoremap <C-a> <Home>
cnoremap <C-a> <Home>
" Move one character forward; <c-f> is too useful to remap for : / ?
inoremap <C-f> <right>
" Move one character backward
inoremap <C-b> <left>
cnoremap <C-b> <left>

" Switch buffers
tnoremap <C-w>; <C-\><C-n>:bn<CR><C-g>
tnoremap <C-w>, <C-\><C-n>:bp<CR><C-g>
nnoremap <C-w>; <C-\><C-n>:bn<CR><C-g>
nnoremap <C-w>, <C-\><C-n>:bp<CR><C-g>
nnoremap ]b <C-\><C-n>:bn<CR><C-g>
nnoremap [b <C-\><C-n>:bp<CR><C-g>
tnoremap ]b <C-\><C-n>:bn<CR><C-g>
tnoremap [b <C-\><C-n>:bp<CR><C-g>

" Alt keys
" <a-d> = Delete word forward; opposite of <c-w>
inoremap <A-d> <C-o>de
cnoremap <A-d> <S-Right><C-w>
" <a-h> = Delete word backward; opposite of <a-d>, same as <c-w>
inoremap <A-h> <C-w>
cnoremap <A-h> <C-w>
" <a-k> = Move up; opposite of <a-j>
inoremap <A-k> <up>
cnoremap <A-k> <up>
" <a-j> = Move down; opposite of <a-k>
inoremap <A-j> <down>
cnoremap <A-j> <down>
" <a-f> = Move one word forward; opposite of <a-b>
inoremap <A-f> <C-o>w
cnoremap <A-f> <S-Right>
" <a-b> = Move one word backward; opposite of <a-f>
inoremap <A-b> <C-o>b
cnoremap <A-b> <S-Left>
" <a-u> = Uppercase to word end; opposite of <a-l>
inoremap <A-u> <C-[>gUeea
" <a-l> = Lowercase to word end; opposite of <a-u>
inoremap <A-l> <C-[>gueea
" <a-t> = Swap current word with previous word
inoremap <A-t> <C-[>diwbPldepa

" Run :file everytime I use a window command
" Similar to how ]b and [b from unimpaired work
" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1075
" To recover R console after pressing <C-w>o (window only), press <C-w>u (window undo)
nnoremap <C-w>+ <C-w>+<C-g>
nnoremap <C-w>- <C-w>-<C-g>
nnoremap <C-w>< <C-w><<C-g>
nnoremap <C-w>= <C-w>=<C-g>
nnoremap <C-w>> <C-w>><C-g>
nnoremap <C-w>H <C-w>H<C-g>
nnoremap <C-w>J <C-w>J<C-g>
nnoremap <C-w>K <C-w>K<C-g>
nnoremap <C-w>L <C-w>L<C-g>
nnoremap <C-w>P <C-w>P<C-g>
nnoremap <C-w>R <C-w>R<C-g>
nnoremap <C-w>S <C-w>S<C-g>
nnoremap <C-w>T <C-w>T<C-g>
nnoremap <C-w>W <C-w>W<C-g>
nnoremap <C-w>] <C-w>]<C-g>
nnoremap <C-w>^ <C-w>^<C-g>
nnoremap <C-w>_ <C-w>_<C-g>
nnoremap <C-w>b <C-w>b<C-g>
nnoremap <C-w>c <C-w>c<C-g>
nnoremap <C-w>d <C-w>d<C-g>
nnoremap <C-w>f <C-w>f<C-g>
nnoremap <C-w>g <C-w>g<C-g>
nnoremap <C-w>h <C-w>h<C-g>
nnoremap <C-w>i <C-w>i<C-g>
nnoremap <C-w>j <C-w>j<C-g>
nnoremap <C-w>k <C-w>k<C-g>
nnoremap <C-w>l <C-w>l<C-g>
nnoremap <C-w>n <C-w>n<C-g>
" https://vi.stackexchange.com/questions/241/undo-only-window
nnoremap <C-w>o :mksession! ~/session.vim<CR>:wincmd o<CR><C-g>
nnoremap <C-w>p <C-w>p<C-g>
nnoremap <C-w>q <C-w>q<C-g>
nnoremap <C-w>r <C-w>r<C-g>
nnoremap <C-w>s <C-w>s<C-g>
nnoremap <C-w>t <C-w>t<C-g>
" https://vi.stackexchange.com/questions/241/undo-only-window
nnoremap <C-w>u :source ~/session.vim<CR>
nnoremap <C-w>v <C-w>v<C-g>
nnoremap <C-w>w <C-w>w<C-g>
nnoremap <C-w>x <C-w>x<C-g>
nnoremap <C-w>z <C-w>z<C-g>
nnoremap <C-w>} <C-w>}<C-g>
nnoremap <C-w><C-b> <C-w>b<C-g>
nnoremap <C-w><C-c> <C-w>c<C-g>
nnoremap <C-w><C-d> <C-w>d<C-g>
nnoremap <C-w><C-f> <C-w>f<C-g>
nnoremap <C-w><C-g> <C-w>g<C-g>
nnoremap <C-w><C-h> <C-w>h<C-g>
nnoremap <C-w><C-i> <C-w>i<C-g>
nnoremap <C-w><C-j> <C-w>j<C-g>
nnoremap <C-w><C-k> <C-w>k<C-g>
nnoremap <C-w><C-l> <C-w>l<C-g>
nnoremap <C-w><C-n> <C-w>n<C-g>
nnoremap <C-w><C-o> <C-w>o<C-g>
nnoremap <C-w><C-p> <C-w>p<C-g>
nnoremap <C-w><C-q> <C-w>q<C-g>
nnoremap <C-w><C-r> <C-w>r<C-g>
nnoremap <C-w><C-s> <C-w>s<C-g>
nnoremap <C-w><C-t> <C-w>t<C-g>
nnoremap <C-w><C-v> <C-w>v<C-g>
nnoremap <C-w><C-w> <C-w>w<C-g>
nnoremap <C-w><C-x> <C-w>x<C-g>
nnoremap <C-w><C-z> <C-w>z<C-g>
nnoremap <C-w><C-]> <C-w>]<C-g>
nnoremap <C-w><C-^> <C-w>^<C-g>
nnoremap <C-w><C-_> <C-w>_<C-g>

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

" Nvim-R mappings
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

autocmd FileType rmd nnoremap <buffer> <leader><CR> :w<CR> :!Rscript -e "rmarkdown::render('%')"<CR>
autocmd FileType rmd nnoremap <buffer> <leader>] :w<CR> :!Rscript -e "bookdown::render_book('%')"<CR>
autocmd FileType r nnoremap <buffer> <leader><CR> :w<CR> :!Rscript %<CR>
autocmd FileType python nnoremap <buffer> <leader><CR> :w ! python3<CR>
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

" vim-pandoc inserts citations with <C-x><C-o>
" disable automatic folding by vim-pandoc
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#blacklist = ["codeblock_start", "codeblock_delim"]
" In addition to vim-pandoc, zotcite and nvim-r can insert citations
" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1940"

" Snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake
au BufNewFile,BufRead *.snk set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au FileType snakemake let Comment="#"
au FileType snakemake setlocal completeopt=menuone,longest
au FileType snakemake setlocal tw=79 tabstop=4 shiftwidth=4 softtabstop=4

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
