return { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
                extensions = {
                    fzf = {},
                },
            },
        })

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>sh", builtin.help_tags)
        vim.keymap.set("n", "<leader>sk", builtin.keymaps)
        vim.keymap.set("n", "<leader>sf", builtin.find_files)
        vim.keymap.set("n", "<leader>ss", builtin.builtin)
        vim.keymap.set("n", "<leader>sw", builtin.grep_string)
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
        vim.keymap.set("n", "<leader>sr", builtin.resume)
        vim.keymap.set("n", "<leader><leader>", builtin.buffers)
        vim.keymap.set("n", "<C-p>", builtin.find_files)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>fp", builtin.oldfiles)
        vim.keymap.set("n", "<leader>sr", builtin.lsp_references)
        vim.keymap.set("n", "<leader>en", function()
            builtin.find_files {
                vim.fn.stdpath("config")
            }
        end)

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set("n", "<leader>/", function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily search in current buffer" })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        vim.keymap.set("n", "<leader>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, { desc = "[S]earch [/] in Open Files" })

        -- Shortcut for searching your Neovim configuration files
        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim files" })

        vim.keymap.set("n", "<leader>sq", function()
            builtin.live_grep({
                prompt_title = "Live Grep to Quickfix",
                results_cb = function(results)
                    vim.cmd("cclose")
                    vim.cmd("caddexpr " .. vim.fn.shellescape(table.concat(results, "\n")))
                    vim.cmd("copen")
                end,
            })
        end, { desc = "[S]earch and send to [Q]uickfix" })
    end,
}
