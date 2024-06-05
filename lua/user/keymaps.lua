local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = "'"
vim.g.maplocalleader = ";"

keymap("n", "<C-k>", "<C-w>k", opts) 
keymap("n", "<C-l>", "<C-w>l", opts) 
keymap("n", "<C-j>", "<C-w>j", opts) 
keymap("n", "<C-h>", "<C-w>h", opts) 

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<F6>", ":NERDTreeToggle<CR>", opts)

keymap("n", "t", ":ToggleTerm<CR>", opts)

keymap("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>fs", ":Telescope grep_string<CR>", opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<leader>zn", ":TZNarrow<CR>", opts)
keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", opts)
keymap("n", "<leader>zf", ":TZFocus<CR>", opts)
keymap("n", "<leader>zm", ":TZMinimalist<CR>", opts)
keymap("n", "<leader>za", ":TZAtaraxis<CR>", opts)


-- TODO: below doesn't work
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

