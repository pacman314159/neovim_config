return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile"},
  config = function () 
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },  
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "markdown",
      },
    })
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end
}
