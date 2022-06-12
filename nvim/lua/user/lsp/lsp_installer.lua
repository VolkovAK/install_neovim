local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.setup {}

local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local server_settings = "user.lsp.settings." .. server.name
    local status_ok_settings, server_opts = pcall(require, server_settings)
    if status_ok_settings then
        require("lspconfig")[server.name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = server_opts,
        }
    else
        require("lspconfig")[server.name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end
end

