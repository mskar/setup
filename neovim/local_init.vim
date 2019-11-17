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
cnoremap <C-l> <right>
" Move one character backward
inoremap <C-b> <left>
cnoremap <C-b> <left>

" Alt keys specific to MacOS
" <a-d> = Delete word forward; opposite of <c-w>
inoremap <A-d> <C-o>de
cnoremap <A-d> <S-Right><C-w>
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

" Nvim-R mappings
" Keyboard shortcuts for <- -> and other operators in R specific files
" https://github.com/jalvesaq/Nvim-R/issues/85
" The trailing spaces below are intentional!
autocmd FileType r inoremap <buffer> ;m <Esc>:normal! a %>%<CR>a<CR>
autocmd FileType rmd inoremap <buffer> ;n <Esc>:normal! a %>%<CR>a<CR>
autocmd FileType r inoremap <buffer> ;m <Esc>:normal! a %>%<CR>a 
autocmd FileType rmd inoremap <buffer> ;m <Esc>:normal! a %>%<CR>a 
autocmd FileType r inoremap <buffer> ;i <Esc>:normal! a %in%<CR>a 
autocmd FileType rmd inoremap <buffer> ;i <Esc>:normal! a %in%<CR>a 
autocmd FileType r inoremap <buffer> ;, <Esc>:normal! a <-<CR>a 
autocmd FileType rmd inoremap <buffer> ;, <Esc>:normal! a <-<CR>a 
autocmd FileType r inoremap <buffer> ;. <Esc>:normal! a -><CR>a 
autocmd FileType rmd inoremap <buffer> ;. <Esc>:normal! a -><CR>a 
autocmd FileType r inoremap <buffer> ;/ <Esc>:normal! a %/%<CR>a 
autocmd FileType rmd inoremap <buffer> ;/ <Esc>:normal! a %/%<CR>a 
autocmd FileType r inoremap <buffer> ;8 <Esc>:normal! a %*%<CR>a 
autocmd FileType rmd inoremap <buffer> ;8 <Esc>:normal! a %*%<CR>a 

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
let R_show_args = 1

" Don't expand a dataframe to show columns by default
" let R_objbr_opendf = 0
" remapping the basic :: send line
nmap <space> <Plug>RSendLine
" remapping selection :: send multiple lines
vmap <space> <Plug>RDSendSelection
" remapping selection :: send multiple lines + echo lines
vmap <space>e <Plug>RESendSelection
" from https://github.com/beigebrucewayne/vim-ide-4-all/blob/master/R-neovim.md
nmap <space>p <Plug>RPrintObj

"" pandoc plugin
" let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#blacklist = ["codeblock_start", "codeblock_delim"]

" Fuzzy finder (FZF)
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nnoremap <silent> <leader>a :Ag<CR>
nnoremap <silent> <leader>B :Bcommits<CR>
nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>C :Commands<CR>
nnoremap <silent> <leader>f :Gfiles<CR>
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>H :Helptags<CR>
nnoremap <silent> <leader>: :History:<CR>
nnoremap <silent> <leader>/ :History/<CR>
nnoremap <silent> <leader>? :History?<CR>
nnoremap <silent> <leader>m :Maps<CR>
nnoremap <silent> <leader>' :Marks<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>L :Lines<CR>
" s is for syntax
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <leader>s :Filetypes<CR>
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

" (In times of great desperation) allow use of the mouse
set mouse=a

" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-shape-in-the-terminal
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

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

highlight Normal ctermfg=white ctermbg=black
