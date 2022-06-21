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
		formatting.black,
		-- Django
		diagnostics.djlint,
		-- Lua
		formatting.stylua,
		-- Markdown
		formatting.markdownlint,
		diagnostics.markdownlint.with(
		    {
		      args = {"-t", "~line_length"},
		    }
		  ),
		diagnostics.proselint,
		-- Fish
		diagnostics.fish,
		-- Docker
		diagnostics.hadolint,
		-- Rust
		formatting.rustfmt,
		-- Golang
		formatting.gofmt,
      diagnostics.golangci_lint,
	},
})
