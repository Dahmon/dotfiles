local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Bamboo"
config.enable_scroll_bar = true

config.keys = {
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
}

return config
