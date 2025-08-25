local common = require("markom-dot.common")
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
  group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true }),
  desc = "No line numbers in terminal mode",
  pattern = "term://*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  desc = "Set keymaps when Lsp is attached.",
  callback = function(args)
    local map = vim.keymap.set
    local opts = { buffer = args.buf }
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method("textDocument/implementation") then
      map("n", "gi", function()
        vim.lsp.buf.implementation()
      end, opts)
    end
    if client:supports_method("textDocument/completion") then
      local chars = {}
      for i = 32, 126 do
        table.insert(chars, string.char(i))
      end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.opt.completeopt = { "menu", "menuone", "noinsert", "popup" }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      map("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end)
    end

    map("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    if client:supports_method("textDocument/declaration") then
      map("n", "gD", function()
        vim.lsp.buf.declaration()
      end, opts)
    end
    map("n", "gr", function()
      vim.lsp.buf.references()
    end, opts)
    map("n", "gR", function()
      vim.lsp.buf.rename()
    end, opts)
    map("n", "<leader>R", function()
      vim.lsp.buf.rename()
    end, opts)
    map("n", ",f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    map("n", "<leader>df", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    map("n", "<leader>db", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    map("n", "<leader>do", function()
      vim.diagnostic.open_float()
    end, opts)
    map(
      "n",
      "<leader>dl",
      common.command({ cmd = "Telescope", args = { "diagnostics" } })
    )
  end,
})
