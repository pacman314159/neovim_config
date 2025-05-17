return{
  'rcarriga/nvim-notify',
  enabled = true,
  config = function()
    require("notify").setup({
      render = "compact",
      top_down = false,
      stages = "static",
    })
  end
}
