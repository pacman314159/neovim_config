return {
  "kevinhwang91/nvim-ufo",
  enabled = true,
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Custom provider for Python #%% cells
    local function python_cell_provider(bufnr)
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      local folds = {}

      local start_line = nil
      for i, line in ipairs(lines) do
        if line:match("^#%%") then
          if start_line then
            -- UFO wants {startLine = int, endLine = int}, 0-based
            table.insert(folds, { startLine = start_line - 1, endLine = i - 2 })
          end
          start_line = i
        end
      end

      -- Last fold goes to EOF
      if start_line then
        table.insert(folds, { startLine = start_line - 1, endLine = #lines - 1 })
      end

      return folds
    end

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == "python" then
          return function()
            return python_cell_provider(bufnr)
          end
        end
        return { "treesitter", "indent" }
      end,
    })
  end,
}
