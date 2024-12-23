require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.startup"
require "user.indent-blankline"
require "user.treesitter"
require "user.true-zen"
require "user.git-blame"
require "user.copilot-chat"
vim.cmd "hi normal guibg=000000"

-- vim.keymap.set('i', '<C-p>', 'copilot#Accept("\\<CR>")', {
--     expr = true,
--     replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true
