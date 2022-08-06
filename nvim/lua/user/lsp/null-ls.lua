local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- General
		diagnostics.codespell,
		-- TS/JS
		diagnostics.eslint,
		formatting.prettier,
		-- Python
		diagnostics.pydocstyle,
		formatting.black.with({
			command = "black",
			args = { "--quiet", "--fast", "-" },
		}),
		diagnostics.mypy,
		diagnostics.flake8,
		-- Django
		diagnostics.djlint,
		formatting.djlint.with({
			command = "djlint",
			args = { "--reformat", "-" },
		}),
		-- Lua
		formatting.stylua,
		-- Markdown
		formatting.markdownlint,
		diagnostics.markdownlint,
		diagnostics.proselint,
		-- Fish
		diagnostics.fish,
		formatting.fish_indent,
		-- Docker
		diagnostics.hadolint,
		-- Rust
		formatting.rustfmt,
		-- Golang
		formatting.gofmt,
		diagnostics.golangci_lint,
		-- rst
		diagnostics.rstcheck,
		-- actionlint
		diagnostics.actionlint,
		-- yamllint
		diagnostics.yamllint,
	},
})

-- Django ("htmldjango")
if vim.fn.executable("djlint") == 1 then
	vim.cmd([[ command! Format :lua vim.lsp.buf.formatting() ]])
	vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
end
