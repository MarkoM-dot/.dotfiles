---Pretty print lua table
---@param v table
---@return table
P = function(v)
  print(vim.inspect(v))
  return v
end
