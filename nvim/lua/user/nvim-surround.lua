-- =========================================
-- Nvim-Surround
-- https://github.com/kylechui/nvim-surround
-- =========================================

local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
	return
end

nvim_surround.setup({})
