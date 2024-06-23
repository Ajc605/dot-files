return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '-' },
                    topdelete = { text = '_' },
                    changedelete = { text = '~' },
                }
            }
            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline <CR>", {})
            vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame <CR>", {})
        end,
    },
}
