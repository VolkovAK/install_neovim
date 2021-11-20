nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" ------------------ CoC section --------------
nmap <silent>gd <cmd>Telescope coc definitions<cr>
nmap <silent>gr <cmd>Telescope coc references<cr>
" ---------------------------------------------

:lua require('telescope').load_extension('fzf')
:lua require('telescope').load_extension('coc')


lua << EOF
require('telescope').setup({
  defaults = {
    -- layout_strategy = 'vertical', 
    layout_config = {
      horizontal = { 
        width = 0.99,
        height = 0.99,
        preview_width = 0.5,
        preview_cutoff = 0
      }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})
EOF
