vim.g.project_type = "none"

local conventional = require "project_setup.conventional"
local embedded = require "project_setup.embedded"

-- ---- COMMANDS ----------------------------------------------------------------------------------------------
vim.api.nvim_create_user_command("SelectProjectType", function()
  print "Select project type [1]arduino [2]pico [3]cpp [4]python [5]stm32 [6]esp-idf"
  local selection = vim.fn.input "Select: "

  if selection == '1' then vim.g.project_type = "arduino"
  elseif selection == '2' then vim.g.project_type = "pico"
  elseif selection == '3' then vim.g.project_type = "cpp"
  elseif selection == '4' then vim.g.project_type = "python"
  elseif selection == '5' then vim.g.project_type = 'stm32'
  elseif selection == '6' then vim.g.project_type = 'esp_idf'
  else
    vim.notify("Invalid project type", vim.log.levels.ERROR)
    vim.g.project_type = "none"
  end
end, {})

vim.api.nvim_create_user_command("ConfigureBoard", function()
  if vim.g.project_type == "arduino" then embedded.config_arduino()
  elseif vim.g.project_type == "pico" then embedded.config_pico()
  elseif vim.g.project_type == 'esp_idf' then embedded.config_esp_idf()
  end
end, {})

vim.api.nvim_create_user_command("NewProject", function()
  vim.cmd('SelectProjectType')
  if vim.g.project_type == 'none' then return end

  local selected_directory = vim.fn.system('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $dialog = New-Object System.Windows.Forms.OpenFileDialog; $dialog.InitialDirectory = \'D:\\\'; $dialog.Filter = \'Folders|`n\'; $dialog.CheckFileExists = $false; $dialog.Multiselect = $false; $dialog.Title = \'Select Folder\'; $dialog.ValidateNames = $false; $dialog.FileName = \'Folder Selection\'; if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) { $selectedPath = [System.IO.Path]::GetDirectoryName($dialog.FileName); Write-Output $selectedPath }"')
  local selected_dir = selected_directory:gsub("\n", "") -- Remove any trailing newline characters

  local project_type = vim.g.project_type
  if project_type == 'arduino' then return
  elseif project_type == 'esp_idf' then embedded.create_esp_project(selected_dir)
  end

end, {})

-- ---- KEY MAPPINGS ----------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>dm", function()
  vim.cmd("!devmgmt.msc")
end, {desc = "[D]evice [M]anager"})

vim.keymap.set("n", "<leader>idf", function()
  if vim.g.project_type ~= "esp_idf" then return end
  embedded.run_idf()
end, {desc = "run ESP_[IDF] Terminal"})

vim.keymap.set("n", "<leader>b", function()
  if vim.g.project_type == 'none' then return
  elseif vim.g.project_type == 'pico' then embedded.build_pico()
  elseif vim.g.project_type == 'stm32' then embedded.build_stm32()
  elseif vim.g.project_type == 'esp_idf' then embedded.build_esp_idf()
  end
end, {desc = "[B]uild project"})

vim.keymap.set("n", "<leader>r", function()
  if vim.g.project_type == "none" then return
  elseif vim.g.project_type == "pico" then embedded.compile_pico()
  elseif vim.g.project_type == "arduino" then embedded.compile_arduino()
  elseif vim.g.project_type == "stm32" then embedded.compile_stm32()
  elseif vim.g.project_type == "cpp" then conventional.compile_cpp()
  end
end, {desc = "compile or [R]un project"})

vim.keymap.set("n", "<leader>u", function()
  if vim.g.project_type == 'none' then return
  elseif vim.g.project_type == 'pico' then embedded.upload_pico()
  elseif vim.g.project_type == 'arduino' then embedded.upload_arduino()
  elseif vim.g.project_type == 'stm32' then embedded.upload_stm32()
  elseif vim.g.project_type == 'esp_idf' then embedded.upload_esp_idf()
  elseif vim.g.project_type == 'cpp' then conventional.run_cpp()
  elseif vim.g.project_type == 'python' then conventional.run_python()
  end
end, {desc = "[U]pload"})

vim.keymap.set("n", "<leader>m", function()
  if vim.g.project_type == "pico" or
    vim.g.project_type == "arduino" or 
    vim.g.project_type == "esp_idf"
    then

      local full_cmd = string.format("!putty.exe -serial COM%s -sercfg %s", vim.g.com_number, vim.g.serial_baudrate)
      vim.cmd("w | "..full_cmd)
    end
  end, {desc = "[M]onitor outputs"})

