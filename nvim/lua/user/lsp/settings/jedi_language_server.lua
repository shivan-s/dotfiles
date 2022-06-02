return {
	settings = {

		python = {
			initializationOptions = {
				codeAction = {
					nameExtractVariable = "jls_extract_vat",
					nameExtractFunction = "jls_extract_def",
				},
			},
			completion = {
				disableSnippets = false,
				resolveEagerly = false,
				ignorePatterns = {},
			},
			diagnostic = {
				enable = true,
				didOpen = true,
				didChange = true,
				globals = { "vim" },
			},
			hover = {
				enable = true,
				--      disable = {
				--        "class" = { all = true, names = [], fullNames = []},
				--         "function" = { all = true, names = [], fullNames = []},
				--        "instance" = { all = true, names = [], fullNames = []},
				--       "keyword" = { all = true, names = [], fullNames = []},
				--        "module" = { all = true, names = [], fullNames = []},
				--        "param" = { all = true, names = [], fullNames = []},
				--        "path" = { all = true, names = [], fullNames = []},
				--        "property" = { all = true, names = [], fullNames = []},
				--        "statement" = { all = true, names = [], fullNames = []},
				--    },
			},
			jediSettings = {
				autoImportModules = {},
				caseInsensitiveCompletion = true,
				debug = false,
			},
			markupKindPreferred = "markdown",
			workspace = {
				extraPaths = {},
				symbols = {
					ignoreFolders = { ".nox", ".tox", ".venv", "__pycache__", "venv" },
					maxSymbols = 20,
				},
			},
		},
	},
}
