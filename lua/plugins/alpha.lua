return {
  "goolord/alpha-nvim",
  enabled = true,
  -- dependencies = { 'echasnovski/mini.icons' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require('alpha.themes.dashboard')
    dashboard.section.buttons.val = {
      dashboard.button("x", "❌  Quit NVIM" , ":qa<CR>"),
      dashboard.button("n", "🔨  Create Platform IO project", ":Pioinit<CR>"),

      dashboard.button("",""), -- For some spacing

      dashboard.button("d", "💿  Open D drive", ":silent Telescope file_browser path=D:/<CR>"),
      dashboard.button("p", "📂  Open PACMAIN folder", ":silent Telescope file_browser path=D:/PACMAIN<CR>"),
      dashboard.button("u", "📂  Open University folder", ":silent Telescope file_browser path=D:/OneDrive_MSFT/Univ<CR>"),

      dashboard.button("",""), -- For some spacing

      dashboard.button("D", "🔍  Search in D drive", ":silent Telescope find_files cwd=D:/<CR>"),
      dashboard.button("P", "🔍  Search in PACMAIN folder", ":silent Telescope find_files cwd=D:/PACMAIN<CR>"),
      dashboard.button("U", "🔍  Search in University folder", ":silent Telescope find_files cwd=D:/OneDrive_MSFT/Univ<CR>"),

      dashboard.button("",""), -- For some spacing

      dashboard.button("o", "💾  Recently opened files", function()
        local builtin = require('telescope.builtin')
        if vim.g.oldfiles_first_time then -- ensure CD into the file in first open
          builtin.oldfiles({
            attach_mappings = function(prompt_bufnr, map)
              local actions = require('telescope.actions')
              local function new_action(bufnr)
                local selection = require('telescope.actions.state').get_selected_entry()
                actions.close(bufnr)
                vim.cmd.edit(selection.path)
                vim.cmd.lcd(vim.fn.fnamemodify(selection.path, ':h'))
                vim.g.oldfiles_first_time = false
              end
              map('i', '<cr>', new_action)
              map('n', '<cr>', new_action)
              return true
            end,
          })
        else
          builtin.oldfiles()
        end
      end),

      dashboard.button("c", "⚙   Vim config", ":silent Telescope find_files cwd=C:/Users/Admin/AppData/Local/nvim<CR>"),
      dashboard.button("w", "⚙   Wezterm config", ":silent e C:/Users/Admin/.wezterm.lua<CR>"),
      dashboard.button("s", "🗑️   Delete shada (files history)", ":!del C:\\Users\\Admin\\AppData\\Local\\nvim-data\\shada /Q<CR>"),
      dashboard.button("t", "🖍️   Change theme", ":silent Telescope colorscheme<CR>"),
    }

    if vim.fn.argc() == 0 then
      require'alpha'.setup(dashboard.config)
    end
  end,
}

