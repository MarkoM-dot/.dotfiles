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
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gD", function()
      vim.lsp.buf.declaration()
    end, opts)
    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "gi", function()
      vim.lsp.buf.implementation()
    end, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", ",f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    vim.keymap.set("n", "<leader>df", function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "<leader>db", function()
      vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>do", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)
  end,
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  desc = "Set keymaps when Lsp is attached.",
})

autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.schedule(function()
      vim.keymap.set("n", "<leader>x", function()
        vim.api.nvim_command("write")
        vim.api.nvim_command("source %")
      end, { buffer = true, silent = true })
    end)
  end,
  group = vim.api.nvim_create_augroup("LuaFileTypeConfig", { clear = true }),
  desc = "Write and execute current buffer.",
})

autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.schedule(function()
      vim.keymap.set("n", "<leader>x", function()
        vim.api.nvim_command("write")
        vim.api.nvim_command("split | term python3 " .. vim.fn.expand("%"))
      end, { buffer = true, silent = true })
    end)
  end,
  group = vim.api.nvim_create_augroup("PythonFileTypeConfig", { clear = true }),
  desc = "Write and execute current buffer.",
})
