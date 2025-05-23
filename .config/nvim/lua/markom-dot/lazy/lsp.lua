return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("neodev").setup()
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      local servers = {
        lua_ls = {
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = {
                globals = {
                  "vim",
                },
              },
              workspace = {
                library = {
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
            },
          },
        },
        clangd = {},
        pyright = {},
        ts_ls = {},
        bashls = {},
        yamlls = {},
        cssls = {},
        html = {},
        dockerls = {},
        sqlls = {},
        marksman = {},
        terraformls = {},
        gopls = {},
        rust_analyzer = {
          capabilities = capabilities,
          cmd = {
            "rustup",
            "run",
            "stable",
            "rust-analyzer",
          },
        },
        emmet_ls = {
          capabilities = capabilities,
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
        },
      }
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers or {}),
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities =
              vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
