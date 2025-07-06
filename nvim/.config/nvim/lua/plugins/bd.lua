return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        {
            'tpope/vim-dadbod',
            lazy = true,
            init = function()
            end,
        },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        { 'tpope/vim-dotenv' },
        { 'xemptuous/sqlua.nvim',                 lazy = true,                      cmd = 'SQLua' },
    },
    lazy = true,
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function() require('sqlua').setup() end
}
