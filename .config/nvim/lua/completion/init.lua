local lspkind = require "lspkind"
local cmp = require "cmp"

cmp.setup({

    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
        },
    }),

    sources = {
        { name = 'nvim_lsp' },
        { name = 'treesitter' },
        { name = 'buffer', keyword_length = 5 }
    },

    formatting = {
        format = lspkind.cmp_format {
            mode = 'symbol_text',
            symbol_map = {
                Text = "☰",
                Method = "ო",
                Function = "𝑓",
                Constructor = "⚒",
                Field = "⛳",
                Variable = "⍺",
                Class = "♛",
                Interface = "⚉",
                Module = "☣",
                Property = "ϕ",
                Unit = "⃝",
                Value = "¢",
                Enum = "∑",
                Keyword = "⚛",
                Snippet = "✄",
                Color = "🎨",
                File = "📄",
                Reference = "ℝ",
                Folder = "🗃",
                EnumMember = "∈",
                Constant = "ℎ",
                Struct = "♻",
                Event = "",
                Operator = "⇒",
                TypeParameter = "┳"
            },
            menu = {
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                treesitter = "[Tree]",
                path = "[Path]",
                gh_issues = "[gh_issues]",
            },
        },
    },
})
