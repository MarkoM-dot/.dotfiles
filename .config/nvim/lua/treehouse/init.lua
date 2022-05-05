require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'lua',
        'rust',
        'typescript',
        'python',
        'bash',
        'css',
        'html',
        'javascript',
        'markdown',
    },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
