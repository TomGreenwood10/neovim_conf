local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
	formatting.black,
	-- diagnostics.flake8.with({ extra_args = { "--max-line-length", 100 } }),
-- 	diagnostics.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }),  -- gl doesn't show diagnostics so not suitable for now.
    },
})
