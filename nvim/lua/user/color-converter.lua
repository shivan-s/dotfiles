-- ====================================================
-- Color-converter
-- https://github.com/NTBBloodbath/color-converter.nvim
-- ====================================================

local status_ok, color_converter = pcall(require, "color-converter")
if not status_ok then
	return
end

color_converter.setup({})
