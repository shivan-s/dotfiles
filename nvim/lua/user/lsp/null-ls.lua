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
    diagnostics.eslint_d,
    formatting.prettier,
    -- Python
    diagnostics.pydocstyle,
    formatting.isort,
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
    formatting.djhtml.with({
      command = "djhtml",
    }),
    -- Lua
    formatting.stylua,
    -- Markdown
    formatting.markdownlint,
    diagnostics.markdownlint.with({
      command = "markdownlint",
      args = { "--stdin", "--disable MD013" },
    }),
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
    -- toml
    formatting.taplo.with({
      command = "taplo",
      args = { "format", "-" },
    }),
  },
})

-- Django ("htmldjango")
if vim.fn.executable("djlint") == 1 then
  vim.cmd([[ command! Format :lua vim.lsp.buf.formatting() ]])
  vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
end
