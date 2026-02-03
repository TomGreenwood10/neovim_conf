vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
  capabilities = require("user.lsp.handlers").capabilities,
  on_attach = require("user.lsp.handlers").on_attach,
})
