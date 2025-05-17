return {
  'kevinhwang91/nvim-ufo',
  enabled = true,
  requires = 'kevinhwang91/promise-async',
  config = function()
    require('ufo').setup()
  end
}
