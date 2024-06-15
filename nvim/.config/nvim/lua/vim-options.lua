vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set number relativenumber")
-- vim.cmd("set spelllang=en_uk")

vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.g.vim_markdown_frontmatter = 1
vim.g.ultest_deprecation_notice = 0

vim.wo.number = true

vim.opt.conceallevel = 1
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.hlsearch = true
vim.opt.spelllang = "en_gb"
vim.opt.spelloptions = "camel"
vim.opt.spell = true

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
-- vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader> fl", "<cmd>b#<CR>")
vim.keymap.set("n", "<leader> q", "<cmd>botright copen<CR>")
vim.keymap.set("n", "<leader> Q", "<cmd>cclose<CR>")
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
