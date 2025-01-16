require("outline").setup({
  outline_window = {
    auto_close = true
  }
})
vim.keymap.set("n", "<leader>o", ":Outline<CR>", {desc = "[O]utline", silent = true})
