return {
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
        },
        cmd = { "Artisan", "Composer", "Npm", "Yarn" },
        keys = {
            -- Doctrine migration shortcuts
            { "<leader>dm", "<cmd>!php bin/console doctrine:migrations:migrate<cr>", desc = "Run Doctrine Migrations" },
            { "<leader>ds", "<cmd>!php bin/console doctrine:schema:update --force<cr>", desc = "Update Doctrine Schema" },
            { "<leader>dv", "<cmd>!php bin/console doctrine:schema:validate<cr>", desc = "Validate Doctrine Schema" },
            { "<leader>dd", "<cmd>!php bin/console doctrine:migrations:diff<cr>", desc = "Generate Migration Diff" },
            { "<leader>dr", "<cmd>!php bin/console doctrine:migrations:rollup<cr>", desc = "Rollup Migrations" },
            
            -- Symfony cache commands
            { "<leader>cc", "<cmd>!php bin/console cache:clear<cr>", desc = "Clear Symfony Cache" },
            { "<leader>cw", "<cmd>!php bin/console cache:warmup<cr>", desc = "Warmup Symfony Cache" },
            
            -- Symfony debug commands
            { "<leader>dbr", "<cmd>!php bin/console debug:router<cr>", desc = "Debug Routes" },
            { "<leader>dbc", "<cmd>!php bin/console debug:container<cr>", desc = "Debug Container" },
            { "<leader>dbe", "<cmd>!php bin/console debug:event-dispatcher<cr>", desc = "Debug Event Dispatcher" },
            
            -- API Platform commands
            { "<leader>apo", "<cmd>!php bin/console api:openapi:export<cr>", desc = "Export OpenAPI Spec" },
            { "<leader>apd", "<cmd>!php bin/console api:debug<cr>", desc = "Debug API Platform" },
        },
        config = function()
            -- Additional Symfony-specific configuration can go here
        end,
    }
}