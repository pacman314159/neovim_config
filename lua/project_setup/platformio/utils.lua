local M = {}

-- M.extra = 'printf \"\\\\n\\\\033[0;33mPlease Press ENTER to continue \\\\033[0m\"; read'
M.extra = ' && echo . && echo . && echo Please Press ENTER to continue'

function M.strsplit(inputstr, del)
  local t = {}
  for str in string.gmatch(inputstr, '([^' .. del .. ']+)') do
    table.insert(t, str)
  end
  return t
end

local function pathmul(n)
  return '..' .. string.rep('/..', n)
end

----------------------------------------------------------------------------------------
local platformio = vim.api.nvim_create_augroup('platformio', { clear = true })

local is_windows = jit.os == 'Windows'
--
M.devNul = is_windows and ' 2>./nul' or ' 2>/dev/null'

function M.open_floaterm(command)
  vim.cmd(string.format('FloatermNew! --width=0.8 --height=0.8 %s', command))
end
----------------------------------------------------------------------------------------

local paths = { '.', '..', pathmul(1), pathmul(2), pathmul(3), pathmul(4), pathmul(5) }

function M.file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M.get_pioini_path()
  for _, path in pairs(paths) do
    if M.file_exists(path .. '/platformio.ini') then
      return path
    end
  end
end

function M.cd_pioini()
  vim.cmd('cd ' .. M.get_pioini_path())
end

function M.pio_install_check()
  local handel = (jit.os == 'Windows') and assert(io.popen 'where.exe pio 2>./nul') or assert(io.popen 'which pio 2>/dev/null')
  local pio_path = assert(handel:read '*a')
  handel:close()

  if #pio_path == 0 then
    vim.notify('Platformio not found in the path', vim.log.levels.ERROR)
    return false
  end
  return true
end

return M
