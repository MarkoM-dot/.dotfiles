-- luacheck: globals s i fmt rep
return {
  s(
    "local function",
    fmt(
      [[local {} = function({})
  {}
end
]],
      {
        i(1, "variable"),
        i(2, "argument"),
        i(3, "body"),
      }
    )
  ),

  s(
    "require",
    fmt([[local {} = require("{}")]], {
      i(1, "module"),
      rep(1),
    })
  ),
}
