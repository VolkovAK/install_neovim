-- Automatic install packer.nvim
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("Packer is installing...")
    PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.notify("Packer is installed")
    vim.cmd [[packadd packer.nvim]]
end


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Packages installation and management
return require("packer").startup(function()
    --
    -- basics
    use "wbthomason/packer.nvim"           -- packer manages itself
    use "nvim-lua/popup.nvim"              -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"            -- Useful lua functions used by lots of plugins

    use "ellisonleao/gruvbox.nvim"         -- colorscheme
    use "numToStr/Comment.nvim"            -- comments: gc
    use "windwp/nvim-autopairs"            -- Autopairs, integrates with both cmp and treesitter

    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"         -- tree-based file browser

    -- cmp plugins
    use "hrsh7th/nvim-cmp"                 -- The completion plugin
    use "hrsh7th/cmp-buffer"               -- buffer completions
    use "hrsh7th/cmp-path"                 -- path completions
    use "hrsh7th/cmp-cmdline"              -- cmdline completions
    use "hrsh7th/cmp-nvim-lua"             -- for nvim itself
    use "hrsh7th/cmp-nvim-lsp"             -- for LSP
    use "saadparwaiz1/cmp_luasnip"         -- snippet completions

    -- snippets
    use "L3MON4D3/LuaSnip"                 -- snippet engine
    use "rafamadriz/friendly-snippets"     -- a bunch of snippets to use

    use "b0o/schemastore.nvim"             -- json scheme

    -- LSP
    use "neovim/nvim-lspconfig"            -- enable LSP
    use "williamboman/nvim-lsp-installer"  -- simple to use language server installer
    use "ray-x/lsp_signature.nvim"         -- function signatures
    -- https://github.com/p00f/clangd_extensions.nvim

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"             -- coloured braces
    -- use "nvim-treesitter/playground"

    -- Git
    use "lewis6991/gitsigns.nvim"



    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)


