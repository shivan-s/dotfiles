-- =======
-- Plugins
-- =======
--
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer ... (close and reopen Neovim)")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that will reload neovim whenever plugin.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Custom Plugins
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- Comment
	use("numToStr/Comment.nvim")

	-- Toggleterm
	use("akinsho/toggleterm.nvim")

	-- Nvim Tree
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	--  Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("BurntSushi/ripgrep")
	use("sharkdp/fd")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("windwp/nvim-autopairs")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Lightline
	use("nvim-lualine/lualine.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Indents
	use("lukas-reineke/indent-blankline.nvim")

	-- Zen
	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")

	-- WhichKey
	use("folke/which-key.nvim")

	-- Docstring/Annotations
	use("danymat/neogen")

	-- Startup
	use("startup-nvim/startup.nvim")

	-- Zk
	use("mickael-menu/zk-nvim")

	-- Images
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- MarkdownPreview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Debugging
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("mfussenegger/nvim-dap-python")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")

	-- Markdown
	use("ixru/nvim-markdown")

	-- Tagbar
	use("preservim/tagbar")

	-- CSS Colors
	use("NTBBloodbath/color-converter.nvim")

	-- nvim-ts-autotag
	use("windwp/nvim-ts-autotag")

	-- git-conflict
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup({})
		end,
	})
	-- neovim surround
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	-- catppuccin theme
	use("catppuccin/nvim")

	-- End of Custom Plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
