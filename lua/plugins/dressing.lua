return {
  'stevearc/dressing.nvim',
  enabled = true,
  config = function()
    require("dressing").setup({
      input = {
        enabled = false
      },
      select = {
        enabled = true,
        backend = {
          "telescope",
          -- "fzf_lua",
          -- "fzf",
          -- "builtin",
          -- "nui"
        },
      }
    })

  end
}
