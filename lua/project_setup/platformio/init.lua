local M = {}

M.piocmd = require("project_setup.platformio.piocmd")
M.piodb = require("project_setup.platformio.piodb")
M.piodebug = require("project_setup.platformio.piodebug")
M.pioinit = require("project_setup.platformio.pioinit")
M.piolib = require("project_setup.platformio.piolib")
M.piomon = require("project_setup.platformio.piomon")
M.piorun = require("project_setup.platformio.piorun")

vim.api.nvim_create_user_command('Pioinit', function()
  vim.g.project_type = "Platform IO"
  M.pioinit()
end, {})
--
vim.api.nvim_create_user_command('Piodb', function()
  M.piodb()
end, {})

vim.api.nvim_create_user_command('Piorun', function(opts)
  M.piorun({opts.args})
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { 'upload', 'uploadfs', 'build', 'clean' } -- Autocompletion options
  end,
})

vim.api.nvim_create_user_command('Piomon', function(opts)
  M.piomon({opts.args})
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { '4800', '9600', '19200', '57600', '115200' }
  end,
})

vim.api.nvim_create_user_command('Piolib', function(opts)
  local args = vim.split(opts.args, ' ')
  M.piolib(args)
end, {
  nargs = '+',
})

vim.api.nvim_create_user_command('Piocmd', function(opts)
  local cmd_table = vim.split(opts.args, ' ')
  M.piocmd(cmd_table)
end, {
  nargs = '*',
})

vim.api.nvim_create_user_command('Piodebug', function()
  M.piodebug()
end, {})

return M
