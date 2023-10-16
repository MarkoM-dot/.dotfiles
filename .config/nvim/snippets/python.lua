local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local snippets, autosnippets = {}, {}

local name_equals_main = ls.s(
  'if __name__ == "__main__"',
  fmt(
    [[
if __name__ == "__main__":
    {}
]],
    { ls.i(1, "") }
  )
)
table.insert(snippets, name_equals_main)

return snippets, autosnippets
