-- ===================================
-- Tagbar
-- https://github.com/preservim/tagbar
-- ===================================
--
local status_ok, tagbar = pcall(require, "tagbar")
if not status_ok then
	return
end

tagbar.setup({})
