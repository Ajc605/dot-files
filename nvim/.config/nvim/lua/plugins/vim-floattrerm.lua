return {
    "voldikss/vim-floaterm",
    config = function ()
        vim.keymap.set("n", "<leader>ft", ":FloatermToggle<CR>")
    end
}
