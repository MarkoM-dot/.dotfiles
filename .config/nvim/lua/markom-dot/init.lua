require("markom-dot.settings.config")
require("markom-dot.settings.mappings")
require("markom-dot.settings.autocommands")
require("markom-dot.plugins")

vim.lsp.enable({
  "astrols",
  "bashls",
  "clangd",
  "dockerls",
  "leanls",
  "luals",
  "pyright",
  "rustanalyzer",
  "terraformls",
  "tsls",
  "yamlls",
})
