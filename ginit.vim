" https://github.com/dvcrn/dotfiles/blob/master/vim/ginit.vim
" This file is only loaded in GUIs

" let g:Guifont=Hack\ Regular:h14
" let g:guifont=DejaVu Sans Mono:h14

" Neovim-qt Guifont command
" Set the font to DejaVu Sans Mono:h13
" :Guifont Hack:h15
" autocmd VimEnter * highlight Comment cterm=italic gui=italic

" vimr doesn't support :Guifont
" https://github.com/qvacua/vimr/issues/314#issuecomment-355882345
if has("gui_vimr")
    :VimRSetFontAndSize "FiraCode Nerd Font", 18
    nnoremap <silent><D-S-{> gT
    nnoremap <silent><D-S-}> gt
    let g:python3_host_prog = "~/miniconda/bin/python3"
endif
