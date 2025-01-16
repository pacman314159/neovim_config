require('codewindow').setup({
  auto_enable = true,
  width_multiplier = 2,
  minimap_width = 12,
  exclude_filetypes = {'help', 'NvimTree', 'dashboard'},
  relative = 'editor',
  -- events = {'FileWritePost'},
  window_border = 'none',
})
require('codewindow').apply_default_keybinds()
