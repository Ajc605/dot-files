return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
        "rcarriga/vim-ultest"
    },
    lazy = true,
    ft = { "cpp" },
    cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    vim.keymap.set("n", "<leader>t", ":TestNearest <CR>"),
    vim.keymap.set("n", "<leader>T", ":TestFile <CR>"),
    vim.keymap.set("n", "<leader>a", ":TestSuite <CR>"),
    vim.keymap.set("n", "<leader>l", ":TestLast <CR>"),
    vim.keymap.set("n", "<leader>g", ":TestVisit <CR>"),
    vim.cmd("let test#strategy = 'floaterm'"),
    vim.cmd("let test#php#phpunit#executable = 'APP_ENV=test ./vendor/bin/phpunit'")
}
