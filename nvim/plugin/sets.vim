set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set updatetime=100

" " tab navigation
" inoremap <C-Up> <ESC>gT
" nnoremap <C-Up> <ESC>gT
" inoremap <C-Down> <ESC>gt
" nnoremap <C-Down> <ESC>gt


" ------------ Copy inner word --------------
function! CopyWord()
    let save_pos = getpos('.')
    " copy this word to register 'y'
    normal! "yyiw
    call setpos('.', save_pos)
    echom "Copied:" getreg('y')
endfunction

nnoremap <C-c> :call CopyWord()<CR>
" paste this word as many times as you need
nnoremap <C-p> viw"yp
" -------------------------------------------

" -------- Split line (opposite of J) -------
nnoremap <S-S> Eli<CR><ESC>
" nnoremap <S-S> i<CR><ESC>W
" -------------------------------------------

" -------- Toggle line number ---------------
function! ToggleSignAndLineColumns()
    if &signcolumn ==# "no"
        set signcolumn=yes
    else
        set signcolumn=no
    endif
    set rnu!
    set nu!
    echom ""
endfunction

nnoremap <C-l> :call ToggleSignAndLineColumns()<CR>
"-------------------------------------------
