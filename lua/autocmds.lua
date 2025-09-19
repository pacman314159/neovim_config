vim.api.nvim_create_augroup('comment_string', { clear = true })

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

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"c", "h", "cpp", "arduino"},
  callback = function()
    vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  end,
  group = "comment_string"
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "syntax"
    end
  end,
})

-- Move cursor to end of yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local event = vim.v.event
    if event.operator == 'y' and (event.regname == '' or event.regname == '"') then
      local end_pos = vim.fn.getpos("']")
      vim.api.nvim_win_set_cursor(0, { end_pos[2], end_pos[3] - 1 })
    end
  end,
})
