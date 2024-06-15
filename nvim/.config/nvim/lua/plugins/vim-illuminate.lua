return {
	"RRethy/vim-illuminate",
	config = function()
		local illuminate = require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 200,
			filetypes_denylist = {
				"dirbuf",
				"dirvish",
				"fugitive",
			},
			under_cursor = true,
		})
		-- vim.keymap.set("n", "<leader>n", illuminate.next_reference())
		-- vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require("illuminate").next_reference{wrap=true}<CR>', {noremap=true, silent=true})
		-- vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require("illuminate").next_reference{reverse=true, wrap=true}<CR>', {noremap=true, silent=true})
	end,
}
