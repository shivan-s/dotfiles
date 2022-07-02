-- ===============================================
-- Nvim-Markdown
-- https://github.com/ixru/nvim-markdown
-- ===============================================

local status_ok, markdown_preview = pcall(require, "nvim-markdown")
if not status_ok then
	return
end

vim.cmd[[
let g:vim_markdown_conceal = 1
]]
