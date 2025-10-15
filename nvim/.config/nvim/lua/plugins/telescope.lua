return { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
        { "<leader>sh",       "<cmd>Telescope help_tags<cr>",      desc = "Help" },
        { "<leader>sk",       "<cmd>Telescope keymaps<cr>",        desc = "Keymaps" },
        { "<leader>sf",       "<cmd>Telescope find_files<cr>",     desc = "Find files" },
        { "<leader>ss",       "<cmd>Telescope builtin<cr>",        desc = "Builtin" },
        { "<leader>sw",       "<cmd>Telescope grep_string<cr>",    desc = "Grep string" },
        { "<leader>sd",       "<cmd>Telescope diagnostics<cr>",    desc = "Diagnostics" },
        { "<leader>sr",       "<cmd>Telescope resume<cr>",         desc = "Resume" },
        { "<leader><leader>", "<cmd>Telescope buffers<cr>",        desc = "Buffers" },
        { "<C-p>",            "<cmd>Telescope find_files<cr>",     desc = "Find files" },
        { "<leader>fg",       "<cmd>Telescope live_grep<cr>",      desc = "Live grep" },
        { "<leader>fp",       "<cmd>Telescope oldfiles<cr>",       desc = "Old files" },
        { "<leader>sl",       "<cmd>Telescope lsp_references<cr>", desc = "LSP references" },
        {
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find(require(
                    "telescope.themes").get_dropdown({ winblend = 10, previewer = false }))
            end,
            desc = "Fuzzy search in buffer"
        },
        {
            "<leader>s/",
            function()
                require("telescope.builtin").live_grep({
                    grep_open_files = true,
                    prompt_title =
                    "Live Grep in Open Files"
                })
            end,
            desc = "Search in open files"
        },
        { "<leader>sn", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end,         desc = "Search Neovim files" },
        {
            "<leader>sC",
            function()
                require("telescope.builtin").find_files({
                    cwd = 'src/Controller/',
                    prompt_title =
                    'Symfony Controllers'
                })
            end,
            desc = "Find Symfony Controllers"
        },
        {
            "<leader>sE",
            function()
                require("telescope.builtin").find_files({
                    cwd = 'src/Entity/',
                    prompt_title =
                    'Symfony Entities'
                })
            end,
            desc = "Find Symfony Entities"
        },
        {
            "<leader>sR",
            function()
                require("telescope.builtin").find_files({
                    cwd = 'src/Repository/',
                    prompt_title =
                    'Symfony Repositories'
                })
            end,
            desc = "Find Symfony Repositories"
        },
        {
            "<leader>sS",
            function()
                require("telescope.builtin").find_files({
                    cwd = 'src/Service/',
                    prompt_title =
                    'Symfony Services'
                })
            end,
            desc = "Find Symfony Services"
        },
        {
            "<leader>sF",
            function()
                require("telescope.builtin").find_files({
                    cwd = 'src/Form/',
                    prompt_title =
                    'Symfony Forms'
                })
            end,
            desc = "Find Symfony Forms"
        },
        { "<leader>sT", function() require("telescope.builtin").find_files({ cwd = 'tests/', prompt_title = 'Tests' }) end, desc = "Find Tests" },
        {
            "<leader>sy",
            function()
                require("telescope.builtin").find_files({
                    find_command = { 'find', '.', '-name', '*.yaml', '-o', '-name', '*.yml' },
                    prompt_title =
                    'YAML Config Files'
                })
            end,
            desc = "Find YAML Config Files"
        },
    },
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- {
        --     "nvim-telescope/telescope-fzf-native.nvim",
        --     build = "make",
        --     cond = function()
        --         return vim.fn.executable("make") == 1
        --     end,
        -- },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = require("telescope.themes").get_dropdown(),
                fzf = {},
            },
        })

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
    end,
}
