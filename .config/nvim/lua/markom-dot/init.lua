local prequire = function(module_name, err_msg)
  local success, module = pcall(require, module_name)
  if not success then
    vim.notify(err_msg .. module)
  end
end

require("markom-dot.settings.config")
require("markom-dot.settings.mappings")
require("markom-dot.settings.autocommands")
prequire("markom-dot.settings.lsp", "Could not import lsp configuration.")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazy_repo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazy_repo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("markom-dot.lazy", { change_detection = { notify = false } })
