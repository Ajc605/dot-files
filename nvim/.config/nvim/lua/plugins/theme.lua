-- catppuccin theme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")
		vim.opt.background = "dark"
	end,
}
-- return {
-- 	"zootedb0t/citruszest.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme citruszest")
-- 	end,
-- }
-- return {
--     "bluz71/vim-moonfly-colors",
--     name = "moonfly",
--     lazy = false,
--     priority = 1000
--     config = function ()
--         vim.cmd("colorscheme moonfly")
--     end
-- }
-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("carbonfox")
-- 		vim.opt.background = "dark"
-- 	end,
-- }
