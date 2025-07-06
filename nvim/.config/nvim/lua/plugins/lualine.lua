return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = { theme = 'horizon' },
            sections = {
                lualine_a = {
                    'mode',
                    {
                        'macro_recording',
                        fmt = function()
                            local recording_register = vim.fn.reg_recording()
                            if recording_register == '' then
                                return ''
                            else
                                return 'Recording @' .. recording_register
                            end
                        end
                    },
                    'branch'
                },
                lualine_b = { 'tabs' },
                lualine_c = { 'filename', 'diff' },
                -- lualine_c = {'buffers'},
                -- lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_x = { 'lsp_status', 'fileformat' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
        }
    end
}
