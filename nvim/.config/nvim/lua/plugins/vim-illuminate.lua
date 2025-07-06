return {
    "RRethy/vim-illuminate",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local illuminate = require("illuminate").configure({
            providers = {
                "lsp",
                "treesitter",
                "regex",
            },
            delay = 200,
            filetypes_denylist = {
                "dirbuf",
                "dirvish",
                "fugitive",
                "alpha",
                "NvimTree",
                "lazy",
                "TelescopePrompt",
            },
            under_cursor = true,
        })
    end,
}
