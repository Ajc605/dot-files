return {
  {
    "gbprod/phpactor.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig"
    },
    build = function()
      require("phpactor.handler.update")()
    end,
  },
    {"qbbr/vim-symfony"}
}
