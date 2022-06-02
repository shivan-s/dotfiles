return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
				needFileStatus = {
					["codestyle-check"] = "Any",
				},
			},
			format = {
				enable = true,
				defaultConfig = {
					indent_style = "space",
					indent_size = "2",
				},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
