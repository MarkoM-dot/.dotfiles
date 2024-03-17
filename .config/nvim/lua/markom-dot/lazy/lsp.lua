local servers = {
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

      -- completion
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lua",

      -- snippets
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
    config = function()
      require("mason").setup()
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
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
          end,

          ["emmet_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.emmet_ls.setup({
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
            })
          end,

          ["rust_analyzer"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.rust_analyzer.setup({
              capabilities = capabilities,
              cmd = {
                "rustup",
                "run",
                "stable",
                "rust-analyzer",
              },
            })
          end,
        },
      })

      -- completion
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
          }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "path" },
          { name = "gh_issues" },
          { name = "treesitter" },
          {
            { name = "buffer", keyword_length = 5 },
          },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
              buffer = "[Buf]",
              nvim_lsp = "[LSP]",
              treesitter = "[Tree]",
              path = "[Path]",
              gh_issues = "[gh_issues]",
              luasnip = "[LuaSnip]",
            },
          }),
        },
      })

      -- luasnip
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "●", "GruvboxOrange" } },
            },
          },
        },
      })

      ls.setup({
        snip_env = {
          s = function(...)
            local snip = ls.s(...)
            -- we can't just access the global `ls_file_snippets`, since it will be
            -- resolved in the environment of the scope in which it was defined.
            table.insert(getfenv(2).ls_file_snippets, snip)
          end,
          parse = function(...)
            local snip = ls.parser.parse_snippet(...)
            table.insert(getfenv(2).ls_file_snippets, snip)
          end,
        },
      })

      --[[
      vim.keymap.set({"i", "s"}, "<C-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand()
        end
      end)
      --]]

      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end)

      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end)
    end,
  },
}
