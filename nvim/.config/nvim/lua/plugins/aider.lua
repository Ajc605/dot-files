return {
    "joshuavial/aider.nvim",
    opts = {
        -- your configuration comes here
        -- if you don't want to use the default settings
        auto_manage_context = true, -- automatically manage buffer context
        default_bindings = false,   -- use default <leader>A keybindings
        debug = false,              -- enable debug logging
    },
    keys = {
        { "<leader>aa", "<cmd>AiderOpen --model gemini/gemini-2.0-flash<CR>", desc = "Aider with Gemini Flash", mode = "n" },
    }
}
