local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font_with_fallback({
	{
		family = "MonaspiceRn Nerd Font Mono",
		weight = "Bold",
		harfbuzz_features = {
			"calt=1",
			"clig=1",
			"liga=1",
			"ss01=1",
			"ss02=1",
			"ss03=1",
			"ss04=1",
			"ss06=1",
			"ss07=1",
			"ss08=1",
			"ss09=1",
		},
	},
	{ family = "JetBrains Mono", weight = "Medium" },
})

config.bold_brightens_ansi_colors = true
config.font_size = 16
config.cell_width = 0.9

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = "Catuppucin Mocha"
config.window_background_opacity = 0.95

return config
