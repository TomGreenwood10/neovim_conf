vim.lsp.config("lua_ls", {
    settings = {
	Lua = {
	    diagnostics = {
		globals = { "vim" },
	    },
	    workspace = {
		library = {
		    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
		    [vim.fn.stdpath("config") .. "/lua"] = true,
		},
	    },
	},
    },
    capabilities = require("user.lsp.handlers").capabilities,
    on_attach = require("user.lsp.handlers").on_attach,
})
