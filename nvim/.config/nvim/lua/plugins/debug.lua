return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { 'nvim-neotest/nvim-nio',           lazy = true },
        { 'rcarriga/nvim-dap-ui',            cmd = 'DapUiToggle', lazy = true },
        { 'theHamsta/nvim-dap-virtual-text', lazy = true },
    },
    lazy = true,
    keys = {
        { "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle DAP UI" },
        { "<leader>dc", function() require("dap").continue() end,          desc = "Continue DAP" },
        { "<leader>dl", function() require("dap").run_last() end,          desc = "Run Last DAP" },
        { "<leader>do", function() require("dap").step_over() end,         desc = "Step Over" },
        { "<leader>di", function() require("dap").step_into() end,         desc = "Step Into" },
    },
    config = function()
        local dap, dapui, daptext = require("dap"), require("dapui"), require("nvim-dap-virtual-text")

        daptext.setup({ all_frames = true, })

        dapui.setup({
            icons = {
                expanded = '▾',
                collapsed = '▸',
            },
            mappings = {
                expand = '<CR>',
                open = 'o',
                remove = 'd',
                edit = 'e',
            },
            sidebar = {
                open_on_start = true,
                elements = {
                    { id = 'breakpoints', size = 0.5 },
                    { id = 'stacks',      size = 0.5 },
                },
                position = 'left', -- 'left' | 'right'
            },
            tray = {
                open_on_start = true,
                elements = {
                    'scopes',
                },
                position = 'bottom', -- 'bottom' | 'top'
                size = 10,
            },
        })
        dap.listeners.before.attach.dapui_config = function()
            dapui.toggle()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.toggle()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.toggle()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.toggle()
        end

        dap.adapters.php = {
            type = 'executable',
            command = 'node',
            args = { '/Users/acooper/Code/vscode-php-debug/out/phpDebug.js' }
        }

        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9003
            }
        }
        vim.fn.sign_define('DapBreakpoint',
            { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    end
}
