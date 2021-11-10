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
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

let g:gruvbox_italic = 1
colorscheme gruvbox
let mapleader = " "

