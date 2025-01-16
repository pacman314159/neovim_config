require("toggleterm").setup{
	size = 50,
  open_mapping = [[<c-\>]],
  direction = "vertical",
  start_in_insert = false,
  shell = 'pwsh'
}

vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]])
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]])
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]])
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]])

vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=tab name="..vim.g.embedded_project_type.."<CR>", {desc = "[T]erminal [T]ab"})
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical name="..vim.g.embedded_project_type.."<CR>", {desc = "[T]erminal [V]ertical"})
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal size=10 name="..vim.g.embedded_project_type.."<CR>", {desc = "[T]erminal [H]orizontal"})
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float name="..vim.g.embedded_project_type.."<CR>", {desc = "[T]erminal [H]orizontal"})
vim.keymap.set("n", "<leader>ts",function()
  cmd = string.format("cd %s", vim.fn.expand("%:p:h"))
  vim.cmd(string.format([[TermExec name=%s cmd=%s]], vim.g.embedded_project_type, "\""..cmd.."\""))
end,{desc = '[T]erminal [S]ync'})

