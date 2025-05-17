vim.g.project_type = "none"

local conventional = require "project_setup.conventional"
local embedded = require "project_setup.embedded"

-- ---- COMMANDS ----------------------------------------------------------------------------------------------
vim.api.nvim_create_user_command("SelectProjectType", function()
  local project_types = {"arduino", "pico", "c", "cpp", "python", "stm32", "esp_idf"}
  local co = coroutine.running()
  vim.ui.select(
    project_types,
    {
      prompt = "Select:",
      format_item = function(item) return item end
    },
    function(choice)
      if choice then
        vim.g.project_type = choice
        print("You selected:", choice)
      else
        print("No selection made")
      end
    end
  )
end, {})

vim.api.nvim_create_user_command("TestSelectBoard", function()
  vim.fn.jobstart("arduino-cli board listall", {
    stdout_buffered = true, -- Ensures output is captured as a whole
    on_stdout = function(_, data)
      local boards = {}
      local board_map = {}

      for i, line in ipairs(data) do
        -- Skip empty lines and the header (first line)
        if line ~= "" and i > 1 then
          -- Separate Board Name and FQBN
          local board_name, fqbn = line:match("^(.-)%s+([%w_:]+)$")
          if board_name and fqbn then
            table.insert(boards, board_name)
            board_map[board_name] = fqbn
          end
        end
      end

      vim.ui.select(
        boards,
        { prompt = "Select Arduino Board:", format_item = function(item) return item end },
        function(choice)
          if choice then
            local selected_fqbn = board_map[choice] -- Retrieve the FQBN
            vim.g.selected_arduino_board = selected_fqbn -- Store the FQBN globally
            print("Selected Arduino Board FQBN:", selected_fqbn) -- Print the selected FQBN
          else
            print("No board selected")
          end
        end
      )
    end,
  })
end, {})

vim.api.nvim_create_user_command("ConfigureBoard", function()
  if vim.g.project_type == "arduino" then embedded.config_arduino()
  elseif vim.g.project_type == "pico" then embedded.config_pico()
  elseif vim.g.project_type == 'esp_idf' then embedded.config_esp_idf()
  end
end, {})

vim.api.nvim_create_user_command("NewProject", function()
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
  elseif vim.g.project_type == 'c' then conventional.run_c()
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

