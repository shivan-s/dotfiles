-- ========================================
-- nvim-dap
-- https://github.com/mfussenegger/nvim-dap
-- ========================================

local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local status_dapui_ok, dapui = pcall(require, "dapui")
if not status_dapui_ok then
	return
end

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("user.dap.dapui")
require("user.dap.settings.python")
require("user.dap.settings.go")
