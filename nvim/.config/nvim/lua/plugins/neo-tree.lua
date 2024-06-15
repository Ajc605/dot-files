return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            default_component_configs = {
                filtered_items = {
                        visible = true,
                        show_hidden_count = false,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    },
                },
            },
        })
        vim.keymap.set("n", "<C-n>", ":Neotree reveal_force_cwd<CR>", {})
    end,
}
