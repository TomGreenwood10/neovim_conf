local ok, conform = pcall(require, "conform")
if not ok then
    return
end

conform.setup({
    formatters_by_ft = {
        go = { "goimports", "gofmt" },
    },
    format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = false,
    },
})
