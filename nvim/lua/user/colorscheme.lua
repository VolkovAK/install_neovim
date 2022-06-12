-- best colorscheme
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    vim.cmd [[ colorscheme default ]]
else
    local base = require("gruvbox.base")
    local colors = require("gruvbox.colors")
    
    vim.opt.background = "dark"

    -- Remove underline for highlights
    vim.api.nvim_set_hl(0, "LspReferenceRead", { bg="#504945" })
    -- vim.api.nvim_set_hl(0, "LspReferenceRead", { bg="#504945", italic=vim.g.gruvbox_italic, })
    vim.api.nvim_set_hl(0, "LspReferenceText", { })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg="#505945" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg=colors.neutral_red, bg=colors.dark0_soft, italic=vim.g.gruvbox_italic })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg=colors.neutral_yellow, bg=colors.dark0_soft, italic=vim.g.gruvbox_italic })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg=colors.neutral_blue, bg=colors.dark0_soft, italic=vim.g.gruvbox_italic })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg=colors.neutral_aqua, bg=colors.dark0_soft, italic=vim.g.gruvbox_italic })
    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { underline=vim.g.gruvbox_underline, italic=vim.g.gruvbox_italic, bold=vim.g.gruvbox_bold })
    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg=colors.dark2, bold=vim.g.gruvbox_bold })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg=colors.dark0 })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg=colors.dark0, fg=colors.orange, bold=vim.g.gruvbox_bold })
    vim.api.nvim_set_hl(0, "LspLinesDiagBorder", { bg=colors.dark0, fg=colors.orange, bold=vim.g.gruvbox_bold })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg=colors.dark0, fg=colors.orange, bold=vim.g.gruvbox_bold })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg=colors.dark0, fg=colors.orange, bold=vim.g.gruvbox_bold })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg=colors.dark0, fg=colors.orange, bold=vim.g.gruvbox_bold })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg=colors.dark0, fg=colors.orange, bold=vim.g.gruvbox_bold })
end

