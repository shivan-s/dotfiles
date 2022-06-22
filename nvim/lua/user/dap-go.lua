-- =====================================
-- nvim-dap-go
-- https://github.com/leoluz/nvim-dap-go
-- =====================================

local status_ok, dap_go = pcall(require, "dap-go")
if not status_ok then
	return
end

dap_go.setup()
