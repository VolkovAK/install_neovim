local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
        "#a89984",
        "#b16286",
        "#d79921",
        "#689d6a",
        "#d65d0e",
        "#458588",
        "#cc241d",
    },
    termcolors = {
        "Green",
        "Yellow",
        "Blue",
        "Magenta",
        "Cyan",
        "White",
        "Red",
    },
  }
}


-- automatically open all folds on opening file
local OpenFolds = vim.api.nvim_create_augroup("OpenFolds", { clear = true })
vim.api.nvim_create_autocmd(
    { "BufWinEnter", "FileReadPost" },
    { pattern = "*", command = "normal zR", group = OpenFolds }
)
