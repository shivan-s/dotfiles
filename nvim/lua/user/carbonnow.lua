-- ==============================================
-- Carbon Now
-- https://github.com/ellisonleao/carbon-now.nvim
-- ==============================================
--
local status_ok, carbon_now = pcall(require, "carbon-now")
if not status_ok then
	return
end

carbon_now.setup({
	base_url = "https://carbon.now.sh/",
	open_cmd = "firefox",
	options = {
		theme = "monokai",
		window_theme = "none",
		font_family = "Hack",
		font_size = "18px",
		bg = "gray",
		line_numbers = true,
		line_height = "133%",
		drop_shadow = false,
		drop_shadow_offset_y = "20px",
		drop_shadow_blur = "68px",
		width = "680",
		watermark = false,
	},
})
