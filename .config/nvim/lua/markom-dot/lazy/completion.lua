return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind-nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess:append("c")

      local cmp = require("cmp")
      local lspkind = require("lspkind")

      lspkind.init({})
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-k>"] = cmp.mapping.scroll_docs(-4),
          ["<C-j>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({
            select = true,
          }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "path" },
          { name = "gh_issues" },
          { name = "treesitter" },
          { name = "buffer", keyword_length = 5 },
        },
        formatting = {
          expandable_indicator = true,
          fields = { "abbr", "menu", "kind" },
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
      cmp.setup.filetype({"sql"}, {
        sources = {
          {name = "vim-dadbod-completion"},
          {name = "buffer"},
        },
      })
    end,
  },
}
