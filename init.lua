-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.startup"
require "user.indent-blankline"
require "user.treesitter"
require "user.zen-mode"
require "user.smear-cursor"
require "user.gitsigns"
require "user.copilot-chat"

vim.cmd "hi normal guibg=000000"
vim.cmd "colorscheme onedark"
vim.cmd "set nowrap"
vim.cmd 'set rtp^="/home/tom/.opam/default/share/ocp-indent/vim"'
