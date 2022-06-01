-- =======
-- Plugins
-- =======
--
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer ... (close and reopen Neovim)"
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that will reload neovim whenever plugin.lua is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return 
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function( )
      return require("packer.util").float{ border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Custom Plugins
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "numToStr/Comment.nvim"
  use "akinsho/toggleterm.nvim"

  -- Nvim Tree
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  --  Treesitter
  use { 
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "p00f/nvim-ts-rainbow"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "BurntSushi/ripgrep"
  use "sharkdp/fd"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "windwp/nvim-autopairs"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Color scheme
  use "junegunn/seoul256.vim"

  -- Lightline
  use "nvim-lualine/lualine.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Indents

  -- Goyo
  -- use "junnegunn/goyo.vim
  -- use "junnegunn/limelight.vim

  -- End of Custom Plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
