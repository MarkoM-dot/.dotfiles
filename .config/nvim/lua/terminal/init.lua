require 'toggleterm'.setup{
    size = 25,
    open_mapping = [[<c-\>]],
    start_in_in_insert = true,
    close_on_exit = true,
    direction = 'float',
    shell = vim.o.shell,
    float_opts = {
        border = 'curved',
        winblend = 0,
    }
}
