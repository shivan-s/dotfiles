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
		diagnostics.eslint,
		formatting.prettier,
		-- Python
		diagnostics.flake8,
		diagnostics.mypy,
		diagnostics.pydocstyle,
		formatting.black,
		formatting.isort,
		-- Lua
		formatting.stylua,
		-- Markdown
		diagnostics.markdownlint,
		diagnostics.proselint,
	},
})
