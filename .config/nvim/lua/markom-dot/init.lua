require("markom-dot.settings.config")
require("markom-dot.settings.mappings")
require("markom-dot.settings.autocommands")
require("markom-dot.executioner")

vim.loader.enable() -- might be default in v10.x.x
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("markom-dot.lazy", { change_detection = { notify = false } })
