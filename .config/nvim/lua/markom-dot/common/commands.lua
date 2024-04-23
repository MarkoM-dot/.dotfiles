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

return M
