return {
  'kevinhwang91/nvim-ufo',
  requires = 'kevinhwang91/promise-async',
  config = function()
    require('ufo').setup()
  end
}
