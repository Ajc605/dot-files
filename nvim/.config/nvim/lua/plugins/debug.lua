return {
    "mfussenegger/nvim-dap",
    dependencies = {
        'nvim-neotest/nvim-nio',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
    },
    config = function ()
        local dap, dapui, daptext = require("dap"), require("dapui"), require("nvim-dap-virtual-text")

        daptext.setup({all_frames = true,})

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
                  { id = 'stacks', size = 0.5 },
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
          args = { '/Users/acooper/workspace/vscode-php-debug/out/phpDebug.js' }
        }

        dap.configurations.php = {
          {
            type = 'php',
            request = 'launch',
            name = 'Listen for Xdebug',
            port = 9003
          }
        }
        vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
        vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
        vim.keymap.set('n', '<leader>du', dapui.toggle, {})
        vim.keymap.set('n', '<leader>dc', dap.continue, {})
        vim.keymap.set('n', '<leader>dl', dap.run_last, {})
        vim.keymap.set('n', '<leader>do', dap.step_over, {})
        vim.keymap.set('n', '<leader>di', dap.step_into, {})
    end
}
