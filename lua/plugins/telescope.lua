return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  enabled = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    -- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.g.oldfiles_first_time = true
    vim.keymap.set('n', '<leader>fo', function()
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
    end, { desc = '[F]ind [O]ld files (cd on first use)' })
    --Open vim config at any moment
    vim.keymap.set("n", "<leader>vc", function()
      builtin.find_files{cwd = vim.fn.stdpath 'config'}
    end, {desc = 'Open [V]im [C]onfig'})
    -- Change colorschem
    vim.keymap.set("n", "<leader>cs", ":Telescope colorscheme<CR>", {desc = "[C]olor[S]cheme", silent = true})
    --
    -- require('telescope').setup({
      --     defaults = {
        --       layout_strategy = 'vertical',
        --       layout_config = { height = 0.95 },
        --     },
        -- })

        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    end
}
