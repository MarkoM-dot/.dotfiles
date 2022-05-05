local lsp_installer = require "nvim-lsp-installer"

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    buf_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>db', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', opts)
end

local servers = {
    'sumneko_lua',
    'rust_analyzer',
    'tsserver',
    'pyright',
    'bashls',
    'cssls',
    'eslint',
    'html',
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing" .. name)
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local opts = { on_attach = on_attach }

    -- Customize your own language server
    if server.name == "sumneko_lua" then
 	    local sumneko_opts = {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" }},
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        }
                    }
                }
            }
        }
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

    server:setup(opts)
end)
