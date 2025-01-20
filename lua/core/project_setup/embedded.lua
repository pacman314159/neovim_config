-- ---- GENERAL (UN-PREPARED) -------------------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>um", function()
  if vim.g.project_type == "none" then return end

  local project_name, command1, command2, command3, command4, full_cmd, project_path
  local drive = "e"

  if vim.g.project_type == "pico" then
    project_path = vim.fn.expand("%:p:h:h")
    project_name = vim.fn.expand("%:p:h:h:t")
    command1 = "cd "..project_path.."\\build"
    command2 = "mingw32-make -j64"
    command3 = string.format("copy %s.uf2 %s:", project_name, drive)
    command4 = "cd "..project_path
    command5 = string.format("putty.exe -serial COM%s -sercfg %s", vim.g.com_number, vim.g.serial_baudrate)

    full_cmd = command1.."&"..command2.."&"..command3.."&"..command4.."&&"..command5
  elseif vim.g.project_type == "arduino" then
    project_path = vim.fn.expand("%:p:h")
    command1 = "cd "..project_path
    command2 = "arduino-cli compile"
    command3 = "arduino-cli upload -v"
    command4 = string.format("putty.exe -serial COM%s -sercfg %s", vim.g.com_number, vim.g.serial_baudrate)

    full_cmd = command1.."&"..command2.."&"..command3.."&&"..command4
  end

  vim.cmd("w | FloatermNew --position=bottomright --autoclose=0 --width=0.3 --height=0.4 "..full_cmd)
end, {desc = "[U]pload and [M]onitor outputs"})

-- ---- ARDUINO -------------------------------------------------------------------------------------------------------------
local function check_arduino_boards()
  local full_cmd = "arduino-cli board list"
  vim.cmd("w | FloatermNew --position=topright --autoclose=0 --width=0.3 --height=0.4 "..full_cmd)
end

local function config_arduino()
  local project_path = vim.fn.expand("%:p")
  print "Select COM port"
  vim.g.com_number = vim.fn.input "COM <your number>"
  print "Select board [1]Uno [2]Nano [3]Nano old bootloader [4]Pro_Mini_5V [or something else]"
  local board = vim.fn.input "Board: "
  vim.g.serial_baudrate = vim.fn.input "Your serial baudrate"

  if(board == '') then return
  elseif(board == '1') then
    board = 'arduino:avr:uno'
  elseif(board == '2') then
    board = 'arduino:avr:nano'
  elseif(board == '3') then
    board = 'arduino:avr:nano:cpu=atmega328old'
  elseif(board == '4') then
    board = 'arduino:avr:pro:cpu=16MHzatmega328'
  end

  local full_cmd = string.format("arduino-cli board attach -p COM%s -b %s %s -v", vim.g.com_number, board, project_path)
  vim.cmd("w | FloatermNew --position=topright --autoclose=0 --width=0.3 --height=0.4 "..full_cmd)

  -- local key = vim.api.nvim_replace_termcodes("<Esc><C-h>", true, false, true)
  -- vim.fn.feedkeys(key)
end

local function compile_arduino()
  local project_path = vim.fn.expand("%:p:h")
  local command1 = "cd "..project_path
  local command2 = "arduino-cli compile"

  local full_cmd = command1.."&"..command2
  vim.cmd("w | FloatermNew --autoclose=0 --width=0.7 --height=0.7 "..full_cmd)
end

local function upload_arduino()
  local project_path = vim.fn.expand("%:p:h")
  local command1 = "cd "..project_path
  local command2 = "arduino-cli compile"
  local command3 = "arduino-cli upload -v"

  local full_cmd = command1.."&"..command2.."&"..command3
  vim.cmd("w | FloatermNew --position=topright --autoclose=0 --width=0.3 --height=0.4 "..full_cmd)

  -- local key = vim.api.nvim_replace_termcodes("<Esc><C-h>", true, false, true)
  -- vim.fn.feedkeys(key)
end


-- ---- PICO -------------------------------------------------------------------------------------------------------------
local function config_pico()
  vim.g.com_number = vim.fn.input "Select port for pico: COM <your number>"
  vim.g.serial_baudrate = vim.fn.input "Your serial baudrate"
end

local function build_pico()
  local project_path, command1, command2, command3, command4, full_cmd

  project_path = vim.fn.expand("%:p:h:h")

  command1 = "cd "..project_path
  command2 = "mkdir build & cd build"
  command3 = "cmake -G \"MinGW Makefiles\" .."

  full_cmd = command1.."&"..command2.."&"..command3.."&"..command1
  vim.cmd("w | FloatermNew --position=topright --autoclose=0 --width=0.3 --height=0.4 "..full_cmd)

  local key = vim.api.nvim_replace_termcodes("<Esc><C-h>", true, false, true)
  vim.fn.feedkeys(key)
end

local function compile_pico()
  local project_path = vim.fn.expand("%:p:h:h")
  local command1 = "cd "..project_path.."\\build"
  local command2 = "mingw32-make -j64"
  local command3 = "cd "..project_path

  local full_cmd = command1.."&"..command2.."&"..command3
  vim.cmd("w | FloatermNew --autoclose=0 --width=0.7 --height=0.7 "..full_cmd)
end

local function upload_pico()
  local drive = 'e'
  local project_path = vim.fn.expand("%:p:h:h")
  local project_name = vim.fn.expand("%:p:h:h:t")
  local command1 = "cd "..project_path.."\\build"
  local command2 = "mingw32-make -j64"
  local command3 = string.format("copy %s.uf2 %s:", project_name, drive)
  local command4 = "cd "..project_path

  local full_cmd = command1.."&"..command2.."&"..command3.."&"..command4
  vim.cmd("w | FloatermNew --position=topright --autoclose=0 --width=0.3 --height=0.4 "..full_cmd)

  local key = vim.api.nvim_replace_termcodes("<Esc><C-h>", true, false, true)
  vim.fn.feedkeys(key)
end


-- ---- STM32 --------------------------------------------------------------------------------------------------------------
local function build_stm32()
  local project_path, command1, command2, command3, command4, full_cmd

  project_path = vim.fn.expand("%:p:h:h:h")

  command1 = "cd "..project_path
  command2 = "mkdir build & cd build"
  command3 = "cmake -G \"MinGW Makefiles\" .."

  full_cmd = command1.."&"..command2.."&"..command3.."&"..command1
  vim.cmd("w | FloatermNew --position=topright --autoclose=0 --width=0.3 --height=0.4 "..full_cmd)

  local key = vim.api.nvim_replace_termcodes("<Esc><C-h>", true, false, true)
  vim.fn.feedkeys(key)

end

local function compile_stm32()
  local project_path = vim.fn.expand("%:p:h:h:h")
  local command1 = "cd "..project_path.."\\build"
  local command2 = "mingw32-make -j64"
  local command3 = "cd "..project_path

  local full_cmd = command1.."&"..command2.."&"..command3
  vim.cmd("w | FloatermNew --autoclose=0 --width=0.7 --height=0.7 "..full_cmd)
end

local function upload_stm32()
  local project_path = vim.fn.expand("%:p:h:h:h")
  local project_name = vim.fn.expand("%:p:h:h:h:t")
  local command1 = "cd "..project_path.."\\build"
  local command2 = "mingw32-make -j64"
  local command3 = string.format("st-flash --reset write %s.bin 0x8000000", project_name)
  local command4 = "cd "..project_path

  local full_cmd = command1.."&"..command2.."&"..command3.."&"..command4
  vim.cmd("w | FloatermNew --position=topright --autoclose=0 --width=0.3 --height=0.4 "..full_cmd)

  -- local key = vim.api.nvim_replace_termcodes("<Esc><C-h>", true, false, true)
  -- vim.fn.feedkeys(key)
end

-- ---- ESPRESSIF IDF --------------------------------------------------------------------------------------------------------------
vim.g.ESP_IDF_TERMINAL_DIRECCTORY = "D:/Software/Espressif/frameworks/esp-idf-v5.3.2/export.bat"

local function create_esp_project(directory)
  local project_name = vim.fn.input "Project name: "
  local esp_chip = vim.fn.input "Select chip: "

  local command1 = "D:"
  local command2 = vim.g.ESP_IDF_TERMINAL_DIRECCTORY
  local command3 = "cd "..directory
  local command4 = "idf.py create-project "..project_name
  local command5 = "cd ".. project_name
  local command6 = "idf.py set-target "..esp_chip

  local full_cmd = command1.."&&"..command2.."&&"..command3.."&&"..command4.."&&"..command5.."&&"..command6
  vim.cmd(string.format("FloatermNew!  --name=%s --width=0.7 --height=0.7 %s", vim.g.project_type, full_cmd))

  local function open_file()
    local file_path = string.format("%s/%s/main/%s.c", directory, project_name, project_name)
    if vim.fn.filereadable(file_path) == 1 then
      vim.cmd("FloatermHide")
      vim.cmd(string.format("e %s", file_path))
      vim.cmd(string.format("cd %s/%s/", directory, project_name))
      return true
    end
    return false
  end
  -- Timer to periodically check if the file exists
  local timer = vim.loop.new_timer()
  timer:start(100, 100, vim.schedule_wrap(function()
    if open_file() then
      timer:stop()
      timer:close()
    end
  end))

end

local function run_idf()
  if vim.g.project_type ~= 'esp_idf' then return end

  local project_path = vim.fn.expand("%:p:h:h")
  local command1 = vim.g.ESP_IDF_TERMINAL_DIRECCTORY
  local command2 = "cd "..project_path
  local command3 = "D:"

  local full_cmd = command1.."&&"..command2.."&&"..command3
  vim.cmd(string.format("FloatermNew!  --name=%s --width=0.7 --height=0.7 %s", vim.g.project_type, full_cmd))
end

local function is_idf_terminal_runned()
  local floaterms = vim.fn['floaterm#buflist#gather']()
  for _, floaterm in ipairs(floaterms) do
    local floaterm_name = vim.api.nvim_buf_get_var(floaterm, 'floaterm_name')
    if floaterm_name == vim.g.project_type then
      return true
    end
  end
  return false
end

local function config_esp_idf() --currently configuring the port number
  print "Select COM port"
  vim.g.com_number = vim.fn.input "COM"
  -- vim.g.serial_baudrate = vim.fn.input "Your serial baudrate"
  vim.g.serial_baudrate = 115200
end

local function build_esp_idf()
  if is_idf_terminal_runned() then
    local full_cmd = "idf.py build"
    vim.cmd("w | FloatermSend --name=esp_idf "..full_cmd)
    vim.cmd("FloatermToggle esp_idf")
  else
    local project_path = vim.fn.expand("%:p:h:h")
    local command1 = vim.g.ESP_IDF_TERMINAL_DIRECCTORY
    local command2 = "cd "..project_path
    local command3 = "D:"
    local command4 = "idf.py build"

    local full_cmd = command1.."&&"..command2.."&&"..command3.."&&"..command4
    vim.cmd(string.format("FloatermNew!  --name=%s --width=0.7 --height=0.7 %s", vim.g.project_type, full_cmd))
  end
end

local function upload_esp_idf()
  if is_idf_terminal_runned() then
    local full_cmd = "idf.py flash"
    if vim.g.com_number then full_cmd = full_cmd .. string.format(" -p COM%s", vim.g.com_number) end
    vim.cmd("w | FloatermSend --name=esp_idf "..full_cmd)
    vim.cmd("FloatermToggle esp_idf")
  else
    local project_path = vim.fn.expand("%:p:h:h")
    local command1 = vim.g.ESP_IDF_TERMINAL_DIRECCTORY
    local command2 = "cd "..project_path
    local command3 = "D:"
    local command4 = "idf.py flash"
    if vim.g.com_number then command4 = command4 .. string.format(" -p COM%s", vim.g.com_number) end

    local full_cmd = command1.."&&"..command2.."&&"..command3.."&&"..command4
    vim.cmd(string.format("FloatermNew!  --name=%s --width=0.7 --height=0.7 %s", vim.g.project_type, full_cmd))
  end
end

-- -----------------------------------------------------------------------------------------------------------------------

return {
  config_pico = config_pico,
  compile_pico = compile_pico,
  build_pico = build_pico,
  upload_pico = upload_pico,

  config_arduino = config_arduino,
  compile_arduino = compile_arduino,
  upload_arduino = upload_arduino,
  check_arduino_boards = check_arduino_boards,

  compile_stm32 = compile_stm32,
  build_stm32 = build_stm32,
  upload_stm32 = upload_stm32,

  run_idf = run_idf,
  build_esp_idf = build_esp_idf,
  upload_esp_idf = upload_esp_idf,
  config_esp_idf = config_esp_idf,

  create_esp_project = create_esp_project,
}
