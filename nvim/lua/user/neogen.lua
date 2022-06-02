-- =================================
-- Neogen
-- https://github.com/danymat/neogen
-- =================================

local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
	return
end

neogen.setup({
	enabled = true, --if you want to disable Neogen
	snippet_engine = "luasnip",
	input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation

	language = {
		lua = {
			template = {
				annotation_convention = "emmylua",
			},
		},
		python = {
			template = {
				annotation_convention = "google_docstrings",
			},
		},
	},
})
