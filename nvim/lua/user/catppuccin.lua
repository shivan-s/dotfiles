-- ==================================
-- Catppuccin
-- https://github.com/catppuccin/nvim
-- ==================================
--
local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	flavour = "mocha", -- mocha, macchiato, frappe, latte
	vim.api.nvim_command("colorscheme catppuccin"),
})
