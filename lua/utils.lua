vim.api.nvim_create_user_command("Google", function()
  local prompt = vim.fn.input "Google Prompt: "
  if prompt == nil or prompt == '' then return end
  local encoded_query = prompt:gsub(" ", "+") -- Replace spacebar to "+"
  local url = "https://www.google.com/search?q=" .. encoded_query
  local open_cmd = "!start"
  vim.cmd(open_cmd .. " " .. url)
end, {})

-- vim.api.nvim_create_user_command("MoltenVenvInit", function()
--   vim.g.python3_host_prog = "C:/Users/Admin/.virtualenvs/neovim/Scripts/python.exe"
--   vim.cmd("MoltenInit neovim")
-- end, { desc = "Initialize Molten with current virtualenv" })
