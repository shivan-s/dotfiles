-- ================
-- Indent-Blankline
-- ================

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.opt.list = false
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
	space_char_blankline = " ",
	show_end_of_line = false,
	show_current_context = true,
	show_current_context_start = true,
})
