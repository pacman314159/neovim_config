return {
  'voldikss/vim-floaterm',
  enabled = true,
  config = function()
    vim.keymap.set("n", "<C-\\>", ":FloatermToggle<CR>", {silent = true})
    vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>:FloatermToggle<CR>", {silent = true})
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]])
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]])
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]])
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]])

    vim.g.floaterm_titleposition = "center"
    vim.g.floaterm_shell = "cmd.exe"
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8

    vim.keymap.set("n", "<leader>ftn", function()
      if(vim.g.project_type == "none") then
        vim.cmd("FloatermNew! --width=0.8 --height=0.8")
      else
        vim.cmd(string.format("FloatermNew --width=0.8 --height=0.8 --name=%s ", vim.g.project_type))
      end
    end, {desc = "[F]loat[T]erm [N]ew", silent = true})

    vim.keymap.set("n", "<leader>ftc", ":FloatermKill!<CR>", {desc = "[F]loat[T]erm [C]ollapse", silent = true})

    vim.keymap.set("t", "<C-]>", "<C-\\><C-n>:FloatermNext<CR>", {silent = true})
    vim.keymap.set("t", "<C-[>", "<C-\\><C-n>:FloatermPrev<CR>", {silent = true})

    vim.keymap.set("t", "<C-A-Right><C-A-Right>", "<C-\\><C-n>:FloatermUpdate --wintype=vsplit --position=botright --width=0.3<CR>", {silent = true})
    vim.keymap.set("t", "<C-A-Right><C-A-Up>", "<C-\\><C-n>:FloatermUpdate --wintype=float --position=topright --width=0.3 --height=0.4<CR>", {silent = true})
    vim.keymap.set("t", "<C-A-Right><C-A-Down>", "<C-\\><C-n>:FloatermUpdate --wintype=float --position=bottomright --width=0.3 --height=0.4<CR>", {silent = true})
    vim.keymap.set("t", "<C-A-Down>", "<C-\\><C-n>:FloatermUpdate --wintype=split --position=botright --height=0.4 --width=0.99<CR>", {silent = true})
    vim.keymap.set("t", "<C-A-Left>", "<C-\\><C-n>:FloatermUpdate --wintype=float --position=center --height=0.8 --width=0.8<CR>", {silent = true})

    vim.api.nvim_set_hl(0, "Floaterm", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatermBorder", { bg = "none" })

  end
}
