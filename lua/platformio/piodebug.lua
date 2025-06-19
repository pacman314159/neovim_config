local utils = require("platformio.utils")
local M = {}

function M.piodebug(args_table)
  if not utils.pio_install_check() then
    return
  end

  utils.cd_pioini()

  local command = string.format("pio debug --interface=gdb -- -x .pioinit %s", utils.extra)
  vim.cmd(string.format("FloatermNew! --width=0.7 --height=0.7 %s", command))
end

return M
