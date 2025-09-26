return {
  'xiyaowong/nvim-transparent',
  enabled = true,
  config = function()
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
        -- UI plugins
        'TelescopeNormal', 'TelescopeBorder', 'TelescopePromptBorder',
        'FloatermBorder',

        -- Bufferline support
        "BufferLineTabClose", "BufferlineBufferSelected", "BufferLineFill",
        "BufferLineBackground", "BufferLineSeparator", "BufferLineIndicatorSelected",
      },
      exclude_groups = { 'LineNr' },
    })
  end
}
