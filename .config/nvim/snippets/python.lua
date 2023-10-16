local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

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

local snippets = {
  name_equals_main,
}
local autosnippets = {}

return snippets, autosnippets
