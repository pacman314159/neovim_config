local utils = require 'project_setup.platformio.utils'

function piobuild()
  utils.cd_pioini()
  local command = 'pio run' .. utils.extra
  utils.open_floaterm(command)
end

function pioupload()
  utils.cd_pioini()
  local command = 'pio run --target upload' .. utils.extra
  utils.open_floaterm(command)
end

function piouploadmonitor()
  utils.cd_pioini()
  local command = 'pio run --target upload & device monitor' .. utils.extra
  utils.open_floaterm(command)
end

function piouploadfs()
  utils.cd_pioini()
  local command = 'pio run --target uploadfs' .. utils.extra
  utils.open_floaterm(command)
end

function pioclean()
  utils.cd_pioini()
  local command = 'pio run --target clean' .. utils.extra
  utils.open_floaterm(command)
end

function piorun(arg_table)
  if not utils.pio_install_check() then
    return
  end
  if arg_table[1] == '' then
    pioupload()
  elseif arg_table[1] == 'upload' then
    pioupload()
  elseif arg_table[1] == 'uploadfs' then
    piouploadfs()
  elseif arg_table[1] == 'build' then
    piobuild()
  elseif arg_table[1] == 'clean' then
    pioclean()
  elseif arg_table[1] == 'uploadmon' then
    piouploadmonitor()
  else
    vim.notify('Invalid argument: build, upload, uploadfs or clean', vim.log.levels.WARN)
  end
end

return piorun
