-- Setup lazy.nvim
require("lazy").setup({

  -- Core Dependencies
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- Colorschemes
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  { "morhetz/gruvbox", lazy = true },
  { "catppuccin/nvim", name = "catppuccon", lazy = true },
  { "cocopon/iceberg.vim", lazy = true },

  -- UI Enhancements
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
  },
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = { { "<Leader>zm", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "startup-nvim/startup.nvim",
    event = "VimEnter",
  },

  -- Editing
  {
    "tpope/vim-commentary",
    keys = { { "gc", mode = { "n", "v" } }, { "gcc", mode = "n" } },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
  {
    "tpope/vim-surround",
    keys = { { "ys", mode = "n" }, { "ds", mode = "n" }, { "cs", mode = "n" }, { "S", mode = "v" } },
  },

  -- Syntax & Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
  },

  -- Navigation & File Management
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    cmd = "Telescope",
    keys = {
      { "<Leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<Leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<Leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "preservim/nerdtree",
    cmd = "NERDTreeToggle",
    keys = { { "<F6>", "<cmd>NERDTreeToggle<cr>", desc = "Toggle NERDTree" } },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = { { "t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "n" } },
    config = function()
      require("toggleterm").setup({
        direction = "horizontal"
      })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
  },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-cmdline", lazy = true },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  { "rafamadriz/friendly-snippets", lazy = true },
  {
    "mlaursen/vim-react-snippets",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  {
    "dsznajder/vscode-es7-javascript-react-snippets",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    build = "yarn install --frozen-lockfile && yarn compile",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Git Integration
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<Leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
      { "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Blame" },
    },
  },

  -- Language-Specific
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "maxmellon/vim-jsx-pretty",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  -- AI Tools - Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat", "CopilotChatOpen" },
    keys = {
      { "<leader>ccp", "<cmd>CopilotChatOpen<cr>", desc = "Copilot Chat", mode = "n" },
      { "<leader>ccp", "<cmd>CopilotChat<cr>", desc = "Copilot Chat", mode = "v" },
    },
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
  },

}, {
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
