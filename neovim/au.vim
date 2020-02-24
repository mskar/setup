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
