local M = {}

local utils = require("platformio.utils")

function M.piodb()
  local command = "pio run -t compiledb" .. utils.extra
  vim.cmd(string.format("FloatermNew! --width=0.7 --height=0.7 %s", command))
end

return M
