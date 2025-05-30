return {
  'akinsho/bufferline.nvim',
  enabled = true,
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup{
      options = {
        mode = "tabs",
        diagnostics = "coc",
        -- separator_style = "slope",
        -- separator = true,
        -- separator_style = "thin",
        -- indicator = {
          --   icon = '▎',
          --   style = 'icon',
          -- },
          --
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true
            }
          },
        },
      }
  end
}
