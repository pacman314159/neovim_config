return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      presets = {
        -- command_palette = true
      },
      lsp = {
        signature = {
          enabled = false,
        },
        hover = {
          enabled = false,
        }
      },
    })
  end
}
