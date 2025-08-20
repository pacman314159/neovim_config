local utils = require("project_setup.platformio.utils")

function piocmd(cmd_table)
  if not utils.pio_install_check() then
    return
  end

  utils.cd_pioini()

  if cmd_table[1] ~= '' then
    local cmd = "pio "
    for _, v in pairs(cmd_table) do
      cmd = cmd .. " " .. v
    end
    local command = cmd .. utils.extra
    utils.open_floaterm(command)
  end
end

return piocmd
