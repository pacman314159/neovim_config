require('leap').create_default_mappings()

vim.keymap.set('n', 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#606060' })
-- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'LeapLabel', { fg = '#ff7f00' })

-- -- Hide the (real) cursor when leaping, and restore it afterwards.
-- vim.api.nvim_create_autocmd('User', { pattern = 'LeapEnter',
--     callback = function()
--       vim.cmd.hi('Cursor', 'blend=100')
--       vim.opt.guicursor:append { 'a:Cursor/lCursor' }
--     end,
--   }
-- )
-- vim.api.nvim_create_autocmd('User', { pattern = 'LeapLeave',
--     callback = function()
--       vim.cmd.hi('Cursor', 'blend=0')
--       vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
--     end,
--   }
-- )
