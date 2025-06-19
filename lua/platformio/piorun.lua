local M = {}

local utils = require 'platformio.utils'

function M.piobuild()
  utils.cd_pioini()
  local command = 'pio run' .. utils.extra
  vim.cmd(string.format("FloatermNew --width=0.7 --height=0.7 %s", command))
end

function M.pioupload()
  utils.cd_pioini()
  local command = 'pio run --target upload' .. utils.extra
  vim.cmd(string.format("FloatermNew --width=0.7 --height=0.7 %s", command))
end

function M.piouploadfs()
  utils.cd_pioini()
  local command = 'pio run --target uploadfs' .. utils.extra
  vim.cmd(string.format("FloatermNew --width=0.7 --height=0.7 %s", command))
end

function M.pioclean()
  utils.cd_pioini()
  local command = 'pio run --target clean' .. utils.extra
  vim.cmd(string.format("FloatermNew --width=0.7 --height=0.7 %s", command))
end

function M.piorun(arg_table)
  if not utils.pio_install_check() then
    return
  end
  if arg_table[1] == '' then
    M.pioupload()
  elseif arg_table[1] == 'upload' then
    M.pioupload()
  elseif arg_table[1] == 'uploadfs' then
    M.piouploadfs()
  elseif arg_table[1] == 'build' then
    M.piobuild()
  elseif arg_table[1] == 'clean' then
    M.pioclean()
  else
    vim.notify('Invalid argument: build, upload, uploadfs or clean', vim.log.levels.WARN)
  end
end

return M
