vim.api.nvim_create_augroup('comment_string', { clear = true })

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"c", "h", "cpp", "arduino"},
  callback = function()
    vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  end,
  group = "comment_string"
})

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"python"},
  callback = function()
    vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
  end,
  group = "comment_string"
})

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"lua"},
  callback = function()
    vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
  end,
  group = "comment_string"
})
