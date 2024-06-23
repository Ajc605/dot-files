return {
    "voldikss/vim-floaterm",
    config = function ()
        vim.keymap.set("t", "<esc>", '<C-\\><C-n>')
        vim.keymap.set("n", "<leader>ft", ":FloatermToggle<CR>")
    end
}
