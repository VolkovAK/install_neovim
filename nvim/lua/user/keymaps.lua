local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>", opts)
keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<cr>", opts)


-- Gitsigns --
keymap("n", "<leader>gs", "<cmd>Gitsigns preview_hunk<cr>", opts)
keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", opts)

-- NvimTree --
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Copy inner word --
function CopyWord()
    vim.cmd [[
        let save_pos = getpos('.')
        normal! "yyiw
        call setpos('.', save_pos)
        echom "Copied:" getreg('y')
    ]]
end

-- copy this word to register 'y'
keymap("n", "<C-y>", ":lua CopyWord()<CR>", opts)
-- paste this word as many times as you need
keymap("n", "<C-p>", 'viw"yp', opts)
---------------------


-- Split line (opposite of J) --
keymap("n", "<S-S>", "Eli<CR><ESC>", term_opts)
---------------------

-- Open LSP info --
keymap("n", "<leader>lsp", ":LspInstallInfo<CR>", opts)
---------------------

-- Switch windows --
keymap("n", "<leader>w", "<ESC><C-w>W", opts)
---------------------

-- Terminal --
function TerminalOptions()
    vim.opt.signcolumn = "no"
    vim.opt.relativenumber = false
    vim.opt.number = true
    vim.cmd [[
        startinsert!
    ]]
end
vim.api.nvim_command("autocmd TermOpen * :lua TerminalOptions()")
function StartTerminal()
    vim.cmd [[
        split
        wincmd j
        resize 10
        terminal
        echom ""
    ]]
end
keymap("n", "<leader>t", ":lua StartTerminal()<CR>", opts)
keymap("t", "<ESC><ESC>", "<C-\\><C-n>", opts)
---------------------

