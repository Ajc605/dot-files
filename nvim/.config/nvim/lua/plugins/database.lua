return {
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function()
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_show_database_icon = 1
            vim.g.db_ui_force_echo_notifications = 1
            vim.g.db_ui_win_position = 'left'
            vim.g.db_ui_winwidth = 80

            -- Auto-completion for SQL
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "sql", "mysql", "plsql" },
                callback = function()
                    require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
                end,
            })
        end,
        keys = {
            { "<leader>db", "<cmd>DBUI<cr>", desc = "Database UI" },
            { "<leader>dt", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
            { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB Buffer" },
            { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename DB Buffer" },
            { "<leader>dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
        },
        cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    }
}