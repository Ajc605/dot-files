return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"MunifTanjim/eslint.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local null_ls = require("null-ls")
		local eslint = require("eslint")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.phpstan,
				null_ls.builtins.completion.spell,
			},
		})

		eslint.setup({
			bin = "eslint", -- or `eslint_d`
			code_actions = {
				enable = true,
				apply_on_save = {
					enable = true,
					types = { "directive", "problem", "suggestion", "layout" },
				},
				disable_rule_comment = {
					enable = true,
					location = "separate_line", -- or `same_line`
				},
			},
			diagnostics = {
				enable = true,
				report_unused_disable_directives = false,
				run_on = "type", -- or `save`
			},
		})
		-- vim.lsp.buf.format({ timeout_ms = 2000 })
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
