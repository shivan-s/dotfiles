local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
        -- TS/JS
		formatting.prettier,
		diagnostics.eslint,
        -- Python
		formatting.black,
        formatting.isort,
		diagnostics.flake8,
        -- Lua
		formatting.stylua,
	},
})
