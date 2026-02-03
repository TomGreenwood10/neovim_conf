vim.lsp.config("pyright", {
    settings = {
	python = {
	    analysis = {
		typeCheckingMode = "standard",
	    },
	},
    },
    capabilities = require("user.lsp.handlers").capabilities,
    on_attach = require("user.lsp.handlers").on_attach,
})
