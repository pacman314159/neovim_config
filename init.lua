local global = vim.g
local o = vim.o
local opt = vim.opt

global.mapleader = ' ' global.maplocalleader = " "

o.showtabline = 1

opt.backspace = '2'
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.wrap = false
-- opt.cursorline = true
opt.cursorline = false
opt.autoread = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.clipboard = "unnamedplus"
opt.number = true
opt.relativenumber = false
opt.termguicolors = true
opt.scrolloff = 0
opt.foldlevelstart = 99
opt.timeoutlen = 600


vim.cmd[[set background=light]] vim.g.theme = 'light'
-- vim.cmd[[set background=dark]] vim.g.theme = 'dark'

-- vim.cmd[[colorscheme vscode]]
-- vim.cmd([[colorscheme catppuccin-latte]])
-- vim.cmd([[colorscheme doom-dracula]])
-- vim.cmd([[colorscheme catppuccin-macchiato]])
-- vim.cmd[[colorscheme github_dark]]
vim.cmd[[colorscheme github_light]]
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme PaperColor]]
-- vim.cmd[[colorscheme rose-pine-moon]]
-- vim.cmd[[colorscheme rose-pine]]
-- vim.cmd[[colorscheme doom-moonlight]]
-- vim.cmd[[colorscheme doom-gruvbox]]
-- vim.cmd[[colorscheme doom-molokai]]
-- vim.cmd[[colorscheme doom-horizon]]
-- vim.cmd[[colorscheme doom-dark+]]
-- vim.cmd[[colorscheme doom-challenger-deep]]
-- vim.cmd[[colorscheme doom-oceanic-next]]
-- vim.cmd[[colorscheme sonokai]]

require("keymaps")
require("autocmds")
require("utils")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup("plugins")

require("project_setup")
