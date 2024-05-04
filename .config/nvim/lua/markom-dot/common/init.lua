--[[
  A kitchen sink of utility functions and settings.
]]
--

local M = {}

---@param cmd {cmd: string|boolean|number}
---@param opts? {output: boolean}
---@return function
M.command = function(cmd, opts)
  return function()
    opts = opts or {}
    vim.api.nvim_cmd(cmd, opts)
  end
end

---@param keymap string
---@param cmd string
M.file_exec = function(keymap, cmd)
  vim.keymap.set("n", keymap, function()
    vim.api.nvim_exec2(cmd .. vim.fn.shellescape(vim.fn.expand("%")), {})
  end, { buffer = true, silent = true })
end

---Set the appropriate indentation for
---frontend development.
M.frontend_indentation = function()
  local set = vim.opt_local

  set.expandtab = true
  set.smartindent = true
  set.tabstop = 2
  set.softtabstop = 2
  set.shiftwidth = 2
end

return M
