local servers = {
  "vimls",
  "lua_ls",
  "clangd",
  "pyright",
  "tsserver",
  "bashls",
  "yamlls",
  "cssls",
  "html",
  "dockerls",
  "sqlls",
  "marksman",
  "gopls",
  "rust_analyzer",
  "emmet_ls",
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        handlers = {
          function(server_name)
            print("settings up", server_name)
            if server_name == "lua_ls" then
              require("lspconfig")[server_name].setup({
                settings = {
                  Lua = {
                    diagnostics = {
                      globals = {
                        "vim",
                      },
                    },
                    workspace = {
                      library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                      },
                    },
                  },
                },
              })
            elseif server_name == "emmet_ls" then
              require("lspconfig")[server_name].setup({
                filetypes = {
                  "html",
                  "typescriptreact",
                  "javascript",
                  "css",
                  "sass",
                  "scss",
                  "less",
                  "tera",
                },
                init_options = {
                  html = { options = { ["bem.enabled"] = true } },
                },
              })
            elseif server_name == "rust_analyzer" then
              require("lspconfig")[server_name].setup({
                cmd = {
                  "rustup",
                  "run",
                  "stable",
                  "rust-analyzer",
                },
              })
            else
              require("lspconfig")[server_name].setup({}) -- default handler options
            end
          end,
        },
      })
    end,
  },
}
