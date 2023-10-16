local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local define_function = ls.s(
  "local function",
  fmt(
    [[local {} = function({})
  {}
end
]],
    {
      ls.i(1, "variable"),
      ls.i(2, "argument"),
      ls.i(3, "body"),
    }
  )
)

local require_module = ls.s(
  "require",
  fmt([[local {} = require("{}")]], {
    ls.i(1, "module"),
    rep(1),
  })
)

local snippets = {
  define_function,
  require_module,
}
local autosnippets = {}

return snippets, autosnippets
