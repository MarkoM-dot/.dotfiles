local command = require("markom-dot.common.commands").command
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  desc = "Briefly highlight yanked text.",
  pattern = "*",
})

autocmd("TermOpen", {
  command = "setlocal nonumber norelativenumber",
  group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true }),
  desc = "No line numbers in terminal mode",
  pattern = "term://*",
})

autocmd("LspAttach", {
  callback = function(e)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[e.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = e.buf }
    local map = vim.keymap.set
    map("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    map("n", "gD", function()
      vim.lsp.buf.declaration()
    end, opts)
    map("n", "gr", function()
      vim.lsp.buf.rename()
    end, opts)
    map("n", "gi", function()
      vim.lsp.buf.implementation()
    end, opts)
    map("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    map("n", ",f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    map("n", "<leader>df", function()
      vim.diagnostic.goto_next()
    end, opts)
    map("n", "<leader>db", function()
      vim.diagnostic.goto_prev()
    end, opts)
    map("n", "<leader>do", function()
      vim.diagnostic.open_float()
    end, opts)
    map("n", "<leader>dl", command({ cmd = "Telescope", args = { "diagnostics" } }))
  end,
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  desc = "Set keymaps when Lsp is attached.",
})
