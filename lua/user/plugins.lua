local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "morhetz/gruvbox" -- colorscheme
  use 'navarasu/onedark.nvim' --colorscheme
  use { "catppuccin/nvim", as = "catppuccon" } -- colorscheme
  use "cocopon/iceberg.vim" -- colorscheme
  use "lukas-reineke/indent-blankline.nvim"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use "tpope/vim-surround"

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  } -- syntax hilighting
  use "Pocco81/true-zen.nvim"

  -- use({
  --     "iamcco/markdown-preview.nvim",
  --   run = function() vim.fn["mkdp#util#install"]() end,
  -- }) -- Mardown html previewer
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use { "nvim-telescope/telescope.nvim", tag = '0.1.4' }
  use "preservim/nerdtree" -- File explorer
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
      direction = "horizontal"
    })
  end}

  use "Pocco81/true-zen.nvim" -- zen modes

  -- cmp pluginsuse {
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completion
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  use 'maxmellon/vim-jsx-pretty' -- jsx support
  use 'SirVer/ultisnips'
  use 'mlaursen/vim-react-snippets'
  use {'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- hooks up formates (e.g. black) to lsp

  use "startup-nvim/startup.nvim"
  use "sindrets/diffview.nvim"  -- git diffs
  use "f-person/git-blame.nvim"


  use "scalameta/nvim-metals"

--   use "CopilotC-Nvim/CopilotChat.nvim"
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
