require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lua",
  "L3MON4D3/LuaSnip",

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  { "rust-lang/rust.vim", ft = "rust" },
  "onsails/lspkind-nvim",
  "ellisonleao/gruvbox.nvim",

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },
})
