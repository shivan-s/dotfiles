-- ============================================
-- Startup
-- https://github.com/startup-nvim/startup.nvim
-- ============================================

local status_ok, startup = pcall(require, "startup")
if not status_ok then
	return
end

startup.setup({
	theme = "evil",
	options = {
		mapping_keys = true, -- display mapping (e.g. <leader>ff)

		-- if < 0 fraction of screen width
		-- if > 0 numbers of column
		cursor_column = 0.5,

		-- after = function() -- function that gets executed at the end
		--   <lua commands>
		-- end
		empty_lines_between_mappings = true, -- add an empty line between mapping/commands
		disable_statuslines = true, -- disable status-, buffer- and tablines
		paddings = { 1, 2 }, -- amount of empty lines before each section (must be equal to amount of sections)
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2", -- the color of folded sections
		-- this can also be changed with the `StartupFoldedSection` highlight group
	},
	parts = { "section_1", "section_2" }, -- all sections in order
})
