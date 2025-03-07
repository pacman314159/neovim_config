-- vim.api.nvim_create_user_command("Google", function()
--   vim.ui.input({ prompt = "Search Google: " }, function(input)
--     if input == nil or input == "" then -- Esc or nil to quit google_search
--       vim.api.nvim_input("<Esc>")
--       return
--     end
--     if input and input ~= "" then
--       local encoded_query = input:gsub(" ", "+") -- Replace spacebar to "+"
--       local url = "https://www.google.com/search?q=" .. encoded_query
--       local open_cmd = "!start"
--       vim.cmd(open_cmd .. " '" .. url .. "'")
--     end
--   end)
-- end

vim.api.nvim_create_user_command("Google", function()
  local prompt = vim.fn.input "Google Prompt: "
  if prompt == nil or prompt == '' then return end
  local encoded_query = prompt:gsub(" ", "+") -- Replace spacebar to "+"
  local url = "https://www.google.com/search?q=" .. encoded_query
  local open_cmd = "!start"
  vim.cmd(open_cmd .. " " .. url)
end, {})
