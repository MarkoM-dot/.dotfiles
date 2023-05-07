require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"vim",
        "vimdoc",
		"lua",
		"rust",
		"typescript",
		"python",
		"bash",
		"css",
		"html",
		"javascript",
		"query",
		"sql",
        "dockerfile",
        "markdown",
        "markdown_inline",
        "perl",
	},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})
