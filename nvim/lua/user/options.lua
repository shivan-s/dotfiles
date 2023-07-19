-- =======
-- Options
-- =======
local options = {
	hidden = true,
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	colorcolumn = "80",
	conceallevel = 0,
	confirm = true,
	cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	guicursor = "i:hor100",
	hlsearch = false,
	ignorecase = true,
	incsearch = true,
	laststatus = 2,
	mouse = "a",
	nu = false,
	numberwidth = 4,
	pumheight = 100,
	relativenumber = false,
	scrolloff = 8,
	shiftwidth = 2,
	showmode = false,
	showtabline = 2,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	softtabstop = 4,
	splitbelow = true,
	splitright = true,
	tabstop = 4,
	termguicolors = true,
	timeoutlen = 100,
	title = true,
	updatetime = 300,
	wrap = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- Not working?
