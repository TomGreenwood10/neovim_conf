require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.startup"
require "user.indent-blankline"
require "user.treesitter"
-- require "user.git-blame"
require "user.zen-mode"
require "user.smear-cursor"
require "user.gitsigns"
-- require "user.nvim-metals"
-- require "user.copilot-chat"

vim.cmd "hi normal guibg=000000"
vim.cmd "colorscheme onedark"
vim.cmd "set nowrap"
vim.cmd 'set rtp^="/home/tom/.opam/default/share/ocp-indent/vim"'
-- vim.keymap.set('i', '<C-p>', 'copilot#Accept("\\<CR>")', {
--     expr = true,
--     replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true
