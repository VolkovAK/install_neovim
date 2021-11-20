" Start NERDTree, if files in dir less then MAX_FILES, then move the cursor to new window
let s:MAX_FILES = 400
let s:filescount = str2float(system('ls -f | wc -l'))
autocmd StdinReadPre * let s:std_in=1
if s:filescount < s:MAX_FILES
    if argc() > 0
        " move nerd_root to location of selected file, not current dir
        let s:nerd_root = fnamemodify(argv()[0], ':p:h')
        autocmd VimEnter * | execute 'NERDTree' s:nerd_root | wincmd p | if isdirectory(argv()[0]) | enew | execute 'cd '.argv()[0] | endif
    else
        autocmd VimEnter * NERDTree | wincmd p 
    endif
endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Some globals
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMouseMode=3

" --------- Toggle NERDTree -----------------
nnoremap <leader>n :NERDTreeToggle<CR>
" -------------------------------------------
