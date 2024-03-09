local M = {}

---@param cmd table
---@param opts table
---@return function
M.command = function(cmd, opts)
  return function()
    vim.api.nvim_cmd(cmd, opts)
  end
end

return M
