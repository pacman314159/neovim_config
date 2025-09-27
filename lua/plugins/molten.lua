return {
  "benlubas/molten-nvim",
  enabled = false,
  build = ":UpdateRemotePlugins",
  dependencies = "willothy/wezterm.nvim",
  init = function()
    vim.g.molten_auto_open_output = false -- cannot be true if molten_image_provider = "wezterm"
    vim.g.molten_output_show_more = true
    vim.g.molten_image_provider = "wezterm"
    vim.g.molten_output_virt_lines = true
    vim.g.molten_split_direction = "right" --direction of the output window, options are "right", "left", "top", "bottom"
    vim.g.molten_split_size = 40 --(0-100) % size of the screen dedicated to the output window
    vim.g.molten_virt_text_output = true
    vim.g.molten_use_border_highlights = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_auto_image_popup = false
    vim.g.molten_output_win_zindex = 50

    vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
    vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
    vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
    vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
    vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "evaluate visual selection" })
  end,
}
