local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension("media_files")

local actions = require "telescope.actions"

local function go_down(prompt_bufnr)
    local selection = require("telescope.actions.state").get_selected_entry()
    local dir = vim.fn.fnamemodify(selection.path, ":p:h")
    require("telescope.actions").close(prompt_bufnr)
    vim.cmd(string.format("silent cd %s", dir))
    print("Moved to " .. dir)
    require("telescope.builtin").find_files()
end

local function go_up(prompt_bufnr)
    require("telescope.actions").close(prompt_bufnr)
    vim.cmd(string.format("silent cd .."))
    print("Moved up")
    require("telescope.builtin").find_files()
end

local os_sep = require("telescope.utils").get_separator()
local conf = require("telescope.config").values

telescope.setup {
  defaults = {
    prompt_prefix = "? ",
    selection_caret = "> ",
    dynamic_preview_title = true,
    layout_config = {
      height = 0.9,
      width = 0.9,
    },
    -- winblend = 5,
    path_display = function(_, path)
      local tail = ""
      local head = path
      for i = #path, 1, -1  do
        if path:sub(i, i) == os_sep then
          head = path:sub(i + 1, -1)
          tail = " [" .. path:sub(0, i) .. "]"
          break
        end
      end
      return string.format("%s%s", head, tail)
    end,
    -- path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<S-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- ["<A-q>"] = actions.smart_send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-c>"] = actions.close,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<S-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- ["<A-q>"] = actions.smart_send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
  },
  pickers = {
    quickfix = {
      trim_text = true,
    },
    lsp_references = {
      trim_text = true,
      layout_strategy = "center",
      results_title = false,
      height = 0.8,
      borderchars = {
        prompt = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
        results = { " ", "│", "─", "│", "│", "│", "┤", "├", },
        preview = { "─", "│", "─", "│", "╭", "╮", "┤", "├", },
      },
      layout_config = {
        anchor = "S",
        height = 0.4,
        preview_cutoff = 10,
        prompt_position = 'bottom',
      },
    },
    lsp_definitions = {
      trim_text = true,
      layout_strategy = "center",
      results_title = false,
      height = 0.8,
      borderchars = {
        prompt = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
        results = { " ", "│", "─", "│", "│", "│", "┤", "├", },
        preview = { "─", "│", "─", "│", "╭", "╮", "┤", "├", },
      },
      layout_config = {
        anchor = "S",
        height = 0.4,
        preview_cutoff = 10,
        prompt_position = 'bottom',
      },
    },
    lsp_type_definitions = {
      trim_text = true,
    },
    lsp_implementations = {
      trim_text = true,
      layout_strategy = "center",
      results_title = false,
      height = 0.8,
      borderchars = {
        prompt = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
        results = { " ", "│", "─", "│", "│", "│", "┤", "├", },
        preview = { "─", "│", "─", "│", "╭", "╮", "┤", "├", },
      },
      layout_config = {
        anchor = "S",
        height = 0.4,
        preview_cutoff = 10,
        prompt_position = 'bottom',
      },
    },
    find_files = {
      find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix"},
      hidden = true,
      mappings = {
        n = {
          ["l"] = go_down,
          ["<Right>"] = go_down,
          ["h"] = go_up,
          ["<Left>"] = go_up,
        },
        i = {
          ["<Right>"] = go_down,
          ["<Left>"] = go_up,
        }
      }
    },
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      }
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

