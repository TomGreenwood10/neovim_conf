local servers = {
    "lua_ls",
    "cssls",
    "html",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "tailwindcss",
    "gopls",
    "ocamllsp",
    "rust_analyzer",
}

local settings = {
    ui = {
	border = "none",
	icons = {
	    package_installed = "◍",
	    package_pending = "◍",
	    package_uninstalled = "◍",
	},
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    -- 	ensure_installed = servers,
    -- 	automatic_installation = true,
})

lspconfig = vim.lsp.config

local opts = {}

for _, server in pairs(servers) do
    opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    vim.lsp.enable(server)
end
