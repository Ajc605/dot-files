-- local function load_workspace_folders()
--     local ok, folders = pcall(dofile, vim.fn.stdpath("config") .. "/local/augment-code-workspaces.lua")
--     return ok and folders or {}
-- end
--
-- vim.g.augment_workspace_folders = load_workspace_folders()
-- vim.g.augment_disable_completions = true
--
-- return {
--     'augmentcode/augment.vim',
--     config = function()
--         vim.keymap.set('n', '<leader>aa', ':Augment chat<CR>', { desc = 'Start Chat' })
--         vim.keymap.set('n', '<leader>at', ':Augment chat-toggle<CR>', { desc = 'Toggel Chate' })
--         vim.keymap.set('v', '<leader>as', ':Augment status<CR>', { desc = 'Augment Status' })
--     end
-- }
