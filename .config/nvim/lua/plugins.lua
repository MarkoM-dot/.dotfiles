vim.cmd [[packadd packer.nvim]]

return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true}) end,
    }
    use 'preservim/nerdtree'
    use 'folke/tokyonight.nvim'


    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use 'nvim-treesitter/playground'

    use 'arcticicestudio/nord-vim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use { 'rust-lang/rust.vim', ft = 'rust' }

    use 'lewis6991/gitsigns.nvim'
    use 'onsails/lspkind-nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)
