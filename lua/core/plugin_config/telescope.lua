local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
--Open vim config at any moment
vim.keymap.set("n", "<leader>vc", function()
  builtin.find_files{cwd = vim.fn.stdpath 'config'}
end, {desc = 'Open [V]im [C]onfig'})
-- Change colorscheme
vim.keymap.set("n", "<leader>cs", ":Telescope colorscheme<CR>", {desc = "[C]olor[S]cheme", silent = true})
--
-- require('telescope').setup({
--     defaults = {
--       layout_strategy = 'vertical',
--       layout_config = { height = 0.95 },
--     },
-- })

vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
