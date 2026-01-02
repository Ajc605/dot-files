return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "MunifTanjim/eslint.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local null_ls = require("null-ls")
        local eslint = require("eslint")
        local autoGroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettierd,
                -- Prefer project's vendor/bin/phpstan, fallback to global
                null_ls.builtins.diagnostics.phpstan.with({
                    prefer_local = "vendor/bin",
                    extra_args = function()
                        -- Use project's phpstan.neon if it exists
                        local config_file = vim.fn.findfile("phpstan.neon", ".;")
                        if config_file ~= "" then
                            return { "-c", config_file }
                        end
                        return {}
                    end,
                }),
                null_ls.builtins.completion.spell,
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "twig" },
                }),
            },
            on_attach = function(client, bufnr)
                local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

                if filetype == "yaml" or filetype == "php" then
                    return
                end

                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_clear_autocmds({
                        group = autoGroup,
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = autoGroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
