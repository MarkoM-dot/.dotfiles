return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      require("luasnip.loaders.from_lua").load({
        paths = { "~/.config/nvim/snippets/" },
      })

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
      local map = vim.keymap.set

      map({ "i", "s" }, "<C-k>", function()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end)

      map({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end)
    end,
  },
}
