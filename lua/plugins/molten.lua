return {
  "benlubas/molten-nvim",
  enabled = false,
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  dependencies = "willothy/wezterm.nvim",
  build = ":UpdateRemotePlugins",

  init = function()
    vim.g.molten_auto_open_output = false -- must be false if molten_image_provider = "wezterm"
    vim.g.molten_output_show_more = true
    vim.g.molten_image_provider = "wezterm"
    vim.g.molten_output_virt_lines = true
    vim.g.molten_split_direction = "right"
    vim.g.molten_split_size = 40
    vim.g.molten_virt_text_output = true
    vim.g.molten_use_border_highlights = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_auto_image_popup = false
    vim.g.molten_output_win_zindex = 50
  end,

  config = function()
    vim.g.molten_wrap_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
  end,
}
