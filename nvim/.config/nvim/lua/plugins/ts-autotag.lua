return {
    'windwp/nvim-ts-autotag',
    lazy = true,
    ft = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
    },
    config = function()
        require('nvim-ts-autotag').setup()
    end
}
