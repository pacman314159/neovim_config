require("transparent").setup({
  enable = true,
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {
    'TelescopeNormal', 
    'TelescopeBorder', 'TelescopePromptBorder',
    'FloatermBorder',
  },
  exclude_groups = {
    'LineNr',
  }
})
require('transparent').clear_prefix('BufferLine')
