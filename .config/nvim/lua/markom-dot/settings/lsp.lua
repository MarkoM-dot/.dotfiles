vim.lsp.config["lua_ls"] = {
  -- Command and arguments to start the server.
  cmd = { "lua-language-server" },
  -- Filetypes to automatically attach to.
  filetypes = { "lua" },
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
}

vim.lsp.config["pyright"] = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

vim.lsp.config["rust_analyzer"] = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git", ".gitignore", "Cargo.lock" },
}

vim.lsp.config["dockerls"] = {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile", "yaml.docker-compose" },
  root_markers = {
    "Dockerfile",
    "docker-compose.yaml",
    "docker-compose.yml",
    "compose.yaml",
    "compose.yml",
    "docker-bake.json",
    "docker-bake.hcl",
    "docker-bake.override.json",
    "docker-bake.override.hcl",
  },
}

vim.lsp.config["yamlls"] = {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
  root_markers = { ".git" },
}

vim.lsp.config["bashls"] = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_markers = { ".git" },
}

vim.lsp.config["terraform_ls"] = {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = { ".terraform", ".git" },
}

vim.lsp.enable({
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "dockerls",
  "yamlls",
  "bashls",
  "terraform_ls",
})
