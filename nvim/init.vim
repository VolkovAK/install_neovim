call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'  " cs[{ - change [ to {, ysiw' - create
Plug 'tpope/vim-commentary'  " gc for comments
Plug 'tpope/vim-repeat'  " for repeating comments, surrounds
Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " multi-cursors, https://github.com/mg979/vim-visual-multi
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'bryanmylee/vim-colorscheme-icons'  " devicons colors

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'


" FOR THE FUTURE
" TreeSitter (needs nightly build or 0.6.0, left it here for future
" looks interesting, but I didn't try
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"
" Debug Prints with context
" https://github.com/polarmutex/contextprint.nvim
"
"

call plug#end()

let g:gruvbox_italic = 1
try
    colorscheme gruvbox
catch
endtry
let mapleader = " "

