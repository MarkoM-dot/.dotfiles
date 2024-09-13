return {
  s(
    "ifname",
    fmt(
      [[
if __name__ == "__main__":
    {}
]],
      { i(1, "") }
    )
  ),
  s(
    [["""]],
    fmt(
      [[
"""{}

Examples:
    >>> {}

Note:
    Make a note here.

Args:
    name: {}

{}:
    {}: {}

Raises:
    {}: {}
"""
  ]],
      {
        i(1, "summary"),
        i(2, "func"),
        i(3, "arg"),
        c(4, { t("Returns"), t("Yields") }),
        i(5, "type"),
        i(6, "description"),
        i(7, "exception"),
        i(8, "description"),
      }
    )
  ),
}
