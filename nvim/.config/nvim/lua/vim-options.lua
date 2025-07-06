vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.g.vim_markdown_frontmatter = 1
vim.g.ultest_deprecation_notice = 0
-- vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.wo.number = true
vim.g.phpactorInputListStrategy = 'phpactor#input#list#fzf'

vim.opt.rtp:append('/usr/local/opt/fzf')
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showtabline = 0
vim.opt.cursorline = true
vim.opt.conceallevel = 1
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.hlsearch = true
vim.opt.spelllang = "en_gb"
vim.opt.spelloptions = "camel"
vim.opt.spell = true
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevelstart = 99

local keymap = vim.keymap.set

keymap("t", "<esc>", '<C-\\><C-n>')
keymap("n", "<c-k>", ":wincmd k<CR>")
keymap("n", "<c-j>", ":wincmd j<CR>")
keymap("n", "<c-h>", ":wincmd h<CR>")
keymap("n", "<c-l>", ":wincmd l<CR>")
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap("n", "<leader> fl", "<cmd>b#<CR>")
keymap("n", "<leader> q", "<cmd>botright copen<CR>")
keymap("n", "<leader> Q", "<cmd>cclose<CR>")
keymap("n", "<leader>v", "<cmd>vsplit<CR>")

vim.defer_fn(function()
  vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "Highlight when yanking (copying) text",
      group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
      callback = function()
          vim.highlight.on_yank()
      end,
  })
end, 0)

vim.defer_fn(function()
  vim.cmd("syntax on")
end, 0)  -- This defers it until after the editor is ready
