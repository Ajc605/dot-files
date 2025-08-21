return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        lazy = true,
        config = function()
            require("mason").setup()
        end,
    },
    {
        'jay-babu/mason-null-ls.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "prettierd" },
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    -- "tailwindcss",
                    "eslint",
                    -- "phpactor@2024.05.21",
                    'intelephense',
                    "yamlls",
                    "lemminx",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local basicLsp = {
                'lua_ls',
                'ts_ls',
                -- 'tailwindcss',
                'eslint',
                'lemminx',
                -- 'intelephense',
                -- 'phpactor',
            }

            for _, lsp in ipairs(basicLsp) do
                lspconfig[lsp].setup({ capabilities = capabilities })
            end

            -- Enhanced Intelephense setup for Symfony development
            -- lspconfig.intelephense.setup({
            --     capabilities = capabilities,
            --     settings = {
            --         intelephense = {
            --             stubs = {
            --                 "bcmath", "bz2", "calendar", "Core", "curl", "date",
            --                 "dba", "dom", "enchant", "fileinfo", "filter", "ftp",
            --                 "gd", "gettext", "hash", "iconv", "imap", "intl",
            --                 "json", "ldap", "libxml", "mbstring", "mcrypt",
            --                 "mysql", "mysqli", "password", "pcntl", "pcre",
            --                 "PDO", "pdo_mysql", "Phar", "readline", "recode",
            --                 "Reflection", "regex", "session", "SimpleXML", "soap",
            --                 "sockets", "sodium", "SPL", "standard", "superglobals",
            --                 "sysvsem", "sysvshm", "tokenizer", "xml", "xdebug",
            --                 "xmlreader", "xmlwriter", "yaml", "zip", "zlib",
            --                 "symfony", "doctrine", "phpunit", "apiplatform"
            --             },
            --             files = {
            --                 maxSize = 5000000,
            --                 associations = {
            --                     "*.php",
            --                     "*.phtml"
            --                 },
            --                 exclude = {
            --                     "**/vendor/**",
            --                     "**/node_modules/**",
            --                     "**/.git/**",
            --                     "**/var/cache/**",
            --                     "**/var/log/**"
            --                 }
            --             },
            --             format = {
            --                 enable = true
            --             },
            --             completion = {
            --                 fullyQualifyGlobalConstantsAndFunctions = false,
            --                 insertUseDeclaration = true,
            --                 triggerParameterHints = true
            --             },
            --             diagnostics = {
            --                 enable = true
            --             }
            --         }
            --     },
            --     on_attach = function(client, bufnr)
            --         local function buf_set_keymap(...)
            --             vim.api.nvim_buf_set_keymap(bufnr, ...)
            --         end
            --
            --         local opts = { noremap = true, silent = true }
            --         buf_set_keymap("n", "<leader>ri", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            --         buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            --     end,
            --     root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
            --     filetypes = { "php" },
            --     flags = {
            --         debounce_text_changes = 150,
            --     },
            -- })
            --
            lspconfig.phpactor.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    local function buf_set_keymap(...)
                        vim.api.nvim_buf_set_keymap(bufnr, ...)
                    end

                    local opts = { noremap = true, silent = true }

                    -- Define your key mappings for phpactor refactoring here
                    -- buf_set_keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                    buf_set_keymap("n", "<leader>ri", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                    -- buf_set_keymap("n", "<leader>rt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
                    buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
                end,
                init_options = {
                    ["symfony.enabled"] = true,
                    ["phpunit.enabled"] = true,
                    ["language_server_phpstan.enabled"] = false,
                    ["language_server_psalm.enabled"] = false,
                    ["indexer.poll_time"] = 5000,
                    ["indexer.stub_cache.enabled"] = true,
                    ["indexer.include_patterns"] = { "**/*.php" },
                    ["indexer.exclude_patterns"] = { "**/vendor/**", "**/node_modules/**", "**/.git/**", "**/var/**" },
                    ["completion_worse.completor.worse.disabled"] = true,
                    ["language_server_completion.trim_leading_dollar"] = true,
                    ["language_server_completion.complete_constructor_parameters"] = false,
                    ["language_server_completion.complete_fully_qualified_class_names"] = false,
                    ["language_server.timeout"] = 30,
                    ["language_server_completion.timeout"] = 10,
                },
                cmd = { "phpactor", "language-server" },
                -- Add root directory detection
                root_dir = lspconfig.util.root_pattern("composer.json", ".git", "phpactor.json", "phpactor.yml"),
                -- Add file type restrictions
                filetypes = { "php" },
                -- Add timeout settings
                flags = {
                    debounce_text_changes = 150,
                },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {})
            -- vim.keymap.set("n", "<leader>ri", vim.lsp.buf.implementation, {})
            -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            -- vim.keymap.set("n", "<leader>gD", vim.lsp.buf.execute_command, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
            -- Set the scrolloff to a higher value
            vim.opt.scrolloff = 999
        end,
    },
}
