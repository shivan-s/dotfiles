-- =============================================
-- Flutter Tools
-- https://github.com/akinsho/flutter-tools.nvim
-- =============================================

local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
	return
end

flutter_tools.setup({})
