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

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
    if require_ok then
	opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end

-- require("mason-lspconfig").setup_handlers {
--   -- The first entry (without a key) will be the default handler
--   -- and will be called for each installed server that doesn't have
--   -- a dedicated handler.
--   function (server_name) -- default handler (optional)
--     require("lspconfig")[server_name].setup()
--   end,
-- }

-- lspconfig.ocamllsp.setup({
--     cmd = { "ocamllsp" },
--     filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
--     root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
--     on_attach = require("user.lsp.handlers").on_attach,
--     capabilities = require("user.lsp.handlers").capabilities,
-- })
