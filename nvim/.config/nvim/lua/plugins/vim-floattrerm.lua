return {
    "voldikss/vim-floaterm",
    keys = {
        { "<leader>ft", ":FloatermToggle<CR>", desc = "Toggle FloatTerm" }
    },
    config = function()
        vim.keymap.set("n", "<leader>ft", ":FloatermToggle<CR>")
    end
}
