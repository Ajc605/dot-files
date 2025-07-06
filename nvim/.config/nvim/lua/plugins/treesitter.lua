return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = 'BufRead',
    config = function()
        local config = require("nvim-treesitter.configs")

        config.setup({
            auto_install = true,
            ensure_installed = {
                "markdown",
                "markdown_inline",
                "javascript",
                "typescript",
                "tsx",
                "css",
                "lua",
                "vim",
                "query",
                "php",
                "phpdoc",
                "twig",
                "yaml",
                "xml",
                "dockerfile",
                "dot",
                "json",
                "regex",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        })
    end,
}
