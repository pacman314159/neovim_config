local M = {}
local default_config = {
  lsp = 'clangd',
}

M.config = vim.deepcopy(default_config)

function M.setup(user_config)
  local valid_keys = {
    lsp = true,
  }
  for key, _ in pairs(user_config or {}) do
    if not valid_keys[key] then
      local error_message = string.format(
        "Invalid configuration key: '%s'\n%s",
        key,
        debug.traceback("Stack trace:")
      )
      vim.api.nvim_err_writeln(error_message)
      return
    end
  end
  M.config = vim.tbl_deep_extend('force', default_config, user_config or {})
end

vim.api.nvim_create_user_command('Pioinit', function()
  require('platformio.pioinit').pioinit()
end, {})

vim.api.nvim_create_user_command('Piodb', function()
  require('platformio.piodb').piodb()
end, {})

vim.api.nvim_create_user_command('Piorun', function(opts)
  local args = opts.args
  require('platformio.piorun').piorun { args }
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { 'upload', 'uploadfs', 'build', 'clean' } -- Autocompletion options
  end,
})

vim.api.nvim_create_user_command('Piomon', function(opts)
  local args = opts.args
  require('platformio.piomon').piomon { args }
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { '4800', '9600', '57600', '115200' }
  end,
})

vim.api.nvim_create_user_command('Piolib', function(opts)
  local args = vim.split(opts.args, ' ')
  require('platformio.piolib').piolib(args)
end, {
  nargs = '+',
})

vim.api.nvim_create_user_command('Piocmd', function(opts)
  local cmd_table = vim.split(opts.args, ' ')
  require('platformio.piocmd').piocmd(cmd_table)
end, {
  nargs = '*',
})

vim.api.nvim_create_user_command('Piodebug', function()
  require('platformio.piodebug').piodebug()
end, {})

return M
