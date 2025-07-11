return {
    {
        "hrsh7th/cmp-nvim-lsp",
        event = "BufReadPre"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "Shougo/neosnippet.vim",
            "Shougo/neosnippet-snippets",
            "honza/vim-snippets",
        },
        event = "InsertEnter"
    },
    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    -- { name = "vsnip" },  -- For vsnip users.
                    -- { name = "luasnip" }, -- For luasnip users.
                    { name = "vim-dadbod-completion" }, -- For luasnip users.
                }),
            })
            -- cmp.setup.filetype({'sql'}, {
            --    sources = {
            --        { name = 'vim-dadbod-completion' },
            --        { name = 'buffer' },
            --    }
            -- })
        end,
    },
}
