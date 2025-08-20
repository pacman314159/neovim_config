local utils = require("project_setup.platformio.utils")

function piodb()
  local command = "pio run -t compiledb" .. utils.extra
  vim.cmd(string.format("FloatermNew! --width=0.7 --height=0.7 %s", command))
end

return piodb
