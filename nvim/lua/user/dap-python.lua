-- ===============================================
-- nvim-dap-python
-- https://github.com/mfussenegger/nvim-dap-python
-- ===============================================

local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
	return
end

dap_python.setup("~/.virtualenvs/debugpy/bin/python")

dap_python.test_runner = "pytest"
