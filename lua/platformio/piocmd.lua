local utils = require("platformio.utils")
local M = {}

function M.piocmd(cmd_table)
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
    vim.cmd(string.format("FloatermNew --width=0.7 --height=0.7 %s", command))
  end
end

return M
