return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
        "rcarriga/vim-ultest",
        "voldikss/vim-floaterm"
    },
    lazy = true,
    ft = { "php", "cpp" },
    cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    config = function()
        -- Test strategy using FloaTerm
        vim.cmd("let test#strategy = 'floaterm'")

        -- Symfony/PHPUnit configuration
        vim.cmd("let test#php#phpunit#executable = './vendor/bin/phpunit'")
        vim.cmd("let test#php#phpunit#options = '--testdox'")

        -- Alternative for different environments
        vim.cmd("let test#php#symfony#executable = 'php bin/console'")

        -- Pest testing framework support (alternative to PHPUnit)
        vim.cmd("let test#php#pest#executable = 'php vendor/bin/pest'")

        -- FloaTerm keybinding
        vim.keymap.set("n", "<leader>ft", ":FloatermToggle<CR>", { desc = "Toggle FloatTerm" })

        -- Key mappings
        vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "Test Nearest" })
        vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { desc = "Test File" })
        vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { desc = "Test Suite" })
        vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { desc = "Test Last" })
        vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { desc = "Visit Test" })

        -- Additional Symfony-specific test commands
        vim.keymap.set("n", "<leader>tf", ":!php bin/phpunit --filter=", { desc = "Test Filter" })
        vim.keymap.set("n", "<leader>tc", ":!php bin/console test:coverage<CR>", { desc = "Test Coverage" })
        vim.keymap.set("n", "<leader>td", ":!php bin/phpunit --debug<CR>", { desc = "Test Debug" })

        -- Database test helpers
        vim.keymap.set("n", "<leader>tdb", ":!php bin/console doctrine:database:create --env=test<CR>",
            { desc = "Create Test DB" })
        vim.keymap.set("n", "<leader>tdm", ":!php bin/console doctrine:migrations:migrate --env=test -n<CR>",
            { desc = "Migrate Test DB" })
        vim.keymap.set("n", "<leader>tdf", ":!php bin/console doctrine:fixtures:load --env=test -n<CR>",
            { desc = "Load Test Fixtures" })
    end
}
