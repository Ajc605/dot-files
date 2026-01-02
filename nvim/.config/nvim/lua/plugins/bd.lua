return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        {
            'tpope/vim-dadbod',
            lazy = true,
        },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        { 'tpope/vim-dotenv' },
        { 'xemptuous/sqlua.nvim', lazy = true, cmd = 'SQLua' },
    },
    lazy = true,
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
        'DBUIRenameBuffer',
        'DBUILastQueryInfo',
    },
    keys = {
        { "<leader>db", "<cmd>DBUI<cr>", desc = "Database UI" },
        { "<leader>dt", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
        { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB Buffer" },
        { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename DB Buffer" },
        { "<leader>dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
    config = function()
        -- Database UI settings
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

        -- Setup sqlua
        require('sqlua').setup()
    end
}
