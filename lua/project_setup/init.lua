local conventional = require "project_setup.conventional"
local embedded = require"project_setup.platformio"

vim.g.project_types = {
  "Platform IO",
  "Python Notebook",
  "Python",
  "C",
  "C++",
}

-- ---- COMMANDS ----------------------------------------------------------------------------------------------
vim.api.nvim_create_user_command("SelectProjectType", function()
  local co = coroutine.running()
  vim.ui.select(
    vim.g.project_types,
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


vim.api.nvim_create_user_command("NewProject", function()
  -- if vim.g.project_type == 'none' then return end
  --
  -- local selected_directory = vim.fn.system('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $dialog = New-Object System.Windows.Forms.OpenFileDialog; $dialog.InitialDirectory = \'D:\\\'; $dialog.Filter = \'Folders|`n\'; $dialog.CheckFileExists = $false; $dialog.Multiselect = $false; $dialog.Title = \'Select Folder\'; $dialog.ValidateNames = $false; $dialog.FileName = \'Folder Selection\'; if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) { $selectedPath = [System.IO.Path]::GetDirectoryName($dialog.FileName); Write-Output $selectedPath }"')
  -- local selected_dir = selected_directory:gsub("\n", "") -- Remove any trailing newline characters
  --
  -- local project_type = vim.g.project_type
  -- if project_type == 'arduino' then return
  -- elseif project_type == 'esp_idf' then embedded.create_esp_project(selected_dir)
  -- end
end, {})

-- ---- KEY MAPPINGS ----------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>r", function()
  if vim.g.project_type == "none" then return
  elseif vim.g.project_type == "Platform IO" then embedded.piorun({'build'})
  elseif vim.g.project_type == "C++" then conventional.compile_cpp()
  elseif vim.g.project_type == "C" then conventional.compile_c()
  end
end, {desc = "compile or [R]un project"})

vim.keymap.set("n", "<leader>u", function()
  if vim.g.project_type == 'none' then return
  elseif vim.g.project_type == 'Platform IO' then embedded.piorun({''})
  elseif vim.g.project_type == 'C++' then conventional.run_cpp()
  elseif vim.g.project_type == 'C' then conventional.run_c()
  elseif vim.g.project_type == 'Python' then conventional.run_python()
  end
end, {desc = "[U]pload"})

vim.keymap.set("n", "<leader>m", function()
  if vim.g.project_type == "Platform IO" then
    embedded.piomon({''})
  end
end, {desc = "[M]onitor outputs"})

vim.keymap.set("n", "<leader>um", function()
  if vim.g.project_type == "Platform IO" then
    embedded.piorun({'uploadmon'})
  end
end, {desc = "[U]pload [M]onitor"})

