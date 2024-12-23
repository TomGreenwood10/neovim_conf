local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {"python", "sql", "csv", "yaml", "json", "hcl", "lua", "markdown", "bash"},
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  }
}
