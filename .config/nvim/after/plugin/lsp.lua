local servers = {
	"vimls",
	"lua_ls",
	"clangd",
	"pyright",
	"tsserver",
	"bashls",
	"yamlls",
	"cssls",
	"html",
	"perlnavigator",
	"dockerls",
	"sqlls",
	"marksman",
	"intelephense",
	"gopls",
	"rust_analyzer",
	"emmet_ls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", ",f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)

	buf_set_keymap("n", "<leader>df", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>db", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)
end

for _, lsp in ipairs(servers) do
	local setup_params = {
		capabilities = capabilities,
		on_attach = on_attach,
	}
	if lsp == "emmet_ls" then
		setup_params.filetypes = {
			"html",
			"typescriptreact",
			"javascript",
			"css",
			"sass",
			"scss",
			"less",
			"tera",
		}
		setup_params.init_options = {
			html = { options = { ["bem.enabled"] = true } },
		}
	elseif lsp == "rust_analyzer" then
		setup_params.cmd = {
			"rustup",
			"run",
			"stable",
			"rust-analyzer",
		}
	elseif lsp == "lua_ls" then
		setup_params.settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		}
	end
	lspconfig[lsp].setup(setup_params)
end
