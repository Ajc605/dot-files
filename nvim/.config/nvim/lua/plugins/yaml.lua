return {
    {
        "cuducos/yaml.nvim",
        ft = { "yaml" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim"
        },
        config = function()
            require("yaml").setup({
                -- Enable YAML validation
                validation = true,
                -- Symfony-specific schemas
                schemas = {
                    ["https://symfony.com/schema/dic/services/services-1.0.xsd"] = {
                        "config/services.yaml",
                        "config/services_*.yaml"
                    },
                    ["https://symfony.com/schema/routing/routing-1.0.xsd"] = {
                        "config/routes.yaml",
                        "config/routes/*.yaml"
                    },
                    ["https://symfony.com/schema/dic/doctrine/doctrine-1.0.xsd"] = {
                        "config/packages/doctrine.yaml"
                    },
                    ["https://symfony.com/schema/dic/security/security-1.0.xsd"] = {
                        "config/packages/security.yaml"
                    }
                }
            })
        end,
        keys = {
            { "<leader>yv", "<cmd>YamlValidate<cr>", desc = "Validate YAML" },
            { "<leader>yf", "<cmd>YamlFormat<cr>", desc = "Format YAML" },
            { "<leader>yt", "<cmd>YamlTelescope<cr>", desc = "Telescope YAML" },
        }
    },
    {
        "someone-stole-my-name/yaml-companion.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("yaml-companion").setup({
                -- Additional schemas for Symfony
                schemas = {
                    {
                        name = "Symfony Services",
                        uri = "https://symfony.com/schema/dic/services/services-1.0.xsd",
                        fileMatch = { "services.yaml", "services_*.yaml" }
                    },
                    {
                        name = "Symfony Routes",
                        uri = "https://symfony.com/schema/routing/routing-1.0.xsd", 
                        fileMatch = { "routes.yaml", "routes/*.yaml" }
                    },
                    {
                        name = "Doctrine Configuration",
                        uri = "https://symfony.com/schema/dic/doctrine/doctrine-1.0.xsd",
                        fileMatch = { "doctrine.yaml" }
                    },
                    {
                        name = "API Platform Configuration",
                        uri = "https://api-platform.com/schema/metadata/metadata-2.0.xsd",
                        fileMatch = { "api_platform.yaml" }
                    }
                },
                lspconfig = {
                    flags = {
                        debounce_text_changes = 150,
                    },
                    settings = {
                        yaml = {
                            validate = true,
                            completion = true,
                            hover = true,
                            schemaStore = {
                                enable = true,
                                url = "https://www.schemastore.org/api/json/catalog.json"
                            }
                        }
                    }
                }
            })
        end
    }
}