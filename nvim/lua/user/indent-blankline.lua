-- ======================================================
-- Indent-Blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim
-- ======================================================

local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

ibl.setup()
