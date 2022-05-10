return require 'packer'.startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'preservim/nerdtree'
    use 'nvim-telescope/telescope.nvim'

    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'arcticicestudio/nord-vim'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'onsails/lspkind-nvim'

    use { 'rust-lang/rust.vim', ft = 'rust' }

    use 'lewis6991/gitsigns.nvim'
end)
