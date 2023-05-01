local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end
mason.setup()

local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

local servers = {
  "ansiblels",
  "cucumber_language_server",
  "denols",
  "dockerls",
  "emmet_ls",
  "esbonio",
  "eslint",
  "gopls",
  "graphql",
  "hls",
  "jedi_language_server",
  "jsonls",
  "ltex",
  "lua_ls",
  "prismals",
  "rust_analyzer",
  "sqlls",
  "svelte",
  "tailwindcss",
  "taplo",
  "tsserver",
  "yamlls",
  "zk",
}

lsp_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    root_dir = require("user.lsp.handlers").root_dir,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end
