local lspkind = require("lspkind")
local cmp = require("cmp")

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
    { name = "luasnip" },
    { name = "path" },
    { name = "gh_issues" },
    { name = "treesitter" },
    { name = "buffer", keyword_length = 5 },
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
