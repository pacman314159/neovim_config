local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  --Theme & Appearance
  use 'GlennLeo/cobalt2'
  use 'ellisonleao/gruvbox.nvim'
  use 'NLKNguyen/papercolor-theme'
  use 'nvim-lualine/lualine.nvim'
  use "b0o/incline.nvim"
  use { "rose-pine/neovim", as = "rose-pine" }
  use 'projekt0n/github-nvim-theme'
  use 'sainnhe/sonokai'
  use "lukas-reineke/indent-blankline.nvim"
  use 'xiyaowong/nvim-transparent'
  use 'GustavoPrietoP/doom-themes.nvim'
  use 'folke/tokyonight.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'Mofiqul/vscode.nvim'
  use 'catppuccin/nvim'


  --Funtionalities
  use 'echasnovski/mini.animate'
  use 'lervag/vimtex'
  use 'rcarriga/nvim-notify'
  use 'hedyhli/outline.nvim'
  use 'MunifTanjim/nui.nvim'
  use {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
  use 'ggandor/leap.nvim'
  use 'voldikss/vim-floaterm'
  use 'nvim-tree/nvim-tree.lua'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim", requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end
  }
  use {'nvim-treesitter/nvim-treesitter' , run= ":TSUpdate"}
  use 'goolord/alpha-nvim'
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
