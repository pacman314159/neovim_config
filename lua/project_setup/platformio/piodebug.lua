local utils = require("project_setup.platformio.utils")

function piodebug(args_table)
  if not utils.pio_install_check() then
    return
  end

  utils.cd_pioini()

  local command = string.format("pio debug --interface=gdb -- -x .pioinit %s", utils.extra)
  utils.open_floaterm(command)
end

return piodebug
