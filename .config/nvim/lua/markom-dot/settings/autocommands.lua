local common = require("markom-dot.common")
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = { "lua", "python", "dockerfile", "rust", "racket" },
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})

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
  callback = function() end,
})

autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  desc = "Set keymaps when Lsp is attached.",
  callback = function(args)
    local map = vim.keymap.set
    local opts = { buffer = args.buf }
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method("textDocument/implementation") then
      map("n", "gi", vim.lsp.buf.implementation, opts)
    end
    if client:supports_method("textDocument/completion") then
      local chars = {}
      for i = 32, 126 do
        table.insert(chars, string.char(i))
      end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.opt.completeopt = { "menu", "menuone", "noinsert", "popup" }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

      map("i", "<C-Space>", vim.lsp.completion.get)

      -- <CR> selects the suggested word for completion even if the documentation states otherwise
      -- the keymap below avoids this pain
      map("i", "<CR>", function()
        return vim.fn.pumvisible() == 1 and "<C-c>a<CR>" or "<CR>"
      end, { expr = true, noremap = true })
    end

    map("n", "gd", vim.lsp.buf.definition, opts)
    if client:supports_method("textDocument/declaration") then
      map("n", "gD", vim.lsp.buf.declaration, opts)
    end
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gR", vim.lsp.buf.rename, opts)

    map("n", "<leader>R", vim.lsp.buf.rename, opts)
    map("n", ",f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    map("n", "<leader>df", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    map("n", "<leader>db", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    map("n", "<leader>do", vim.diagnostic.open_float, opts)
    map(
      "n",
      "<leader>dl",
      common.command({ cmd = "Telescope", args = { "diagnostics" } })
    )
  end,
})
