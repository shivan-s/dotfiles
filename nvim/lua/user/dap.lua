-- ========================================
-- nvim-da
-- https://github.com/mfussenegger/nvim-dap
-- ========================================

local status_ok, _ = pcall(require, "dap")
if not status_ok then
	return
end

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
