local global = vim.g
local o = vim.o local opt = vim.opt

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
opt.scrolloff = 5
opt.foldlevelstart = 99
opt.timeoutlen = 600


vim.cmd[[set background=light]] vim.g.theme = 'light'
-- vim.cmd[[set background=dark]] vim.g.theme = 'dark'

-- vim.cmd[[colorscheme vscode]]
vim.cmd([[colorscheme catppuccin-latte]])
-- vim.cmd([[colorscheme catppuccin-macchiato]])
-- vim.cmd[[colorscheme github_dark]]
-- vim.cmd[[colorscheme github_light]]
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

require("core.keymaps")
require("core.autocmds")
require("core.plugins")
require("core.plugin_config")
require("core.project_setup")
