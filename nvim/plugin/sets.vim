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

" ------------ Mouse support ----------------
set mouse=a
" -------------------------------------------
"
" ------------ Clipboard support ------------
" xclip must be installed!
" standard yank will copy selected to clipboard
set clipboard+=unnamedplus
" -------------------------------------------

" ------------ Copy inner word --------------
function! CopyWord()
    let save_pos = getpos('.')
    " copy this word to register 'y'
    normal! "yyiw
    call setpos('.', save_pos)
    echom "Copied:" getreg('y')
endfunction

nnoremap <C-y> :call CopyWord()<CR>
" paste this word as many times as you need
nnoremap <C-p> viw"yp
" -------------------------------------------

" -------- Split line (opposite of J) -------
nnoremap <S-S> Eli<CR><ESC>
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
" -------------------------------------------

" --------- Switch windows ------------------
nnoremap <leader>w <ESC><C-w>W
" -------------------------------------------
