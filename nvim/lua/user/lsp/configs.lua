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
	"esbonio",
	"eslint",
	"gopls",
	"jsonls",
	"ltex",
	"jedi_language_server",
	"rust_analyzer",
	"lua_ls",
	"tsserver",
	"yamlls",
	"zk",
	"taplo",
	"emmet_ls",
	"dockerls",
	"prismals",
	"tailwindcss",
	"svelte",
	"sqlls",
}

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
