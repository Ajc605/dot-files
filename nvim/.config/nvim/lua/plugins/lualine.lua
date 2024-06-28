return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require('lualine').setup{
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
                  }
                },
                lualine_b = {'branch'},
                lualine_c = {'filename'},
                -- lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_x = {},
                lualine_y = {'progress'},
                lualine_z = {'location'},
            },
        }
    end
}
