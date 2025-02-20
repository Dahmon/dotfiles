local wezterm = require("wezterm")
local action = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = "Bamboo"
config.enable_scroll_bar = true
config.max_fps = 120

config.keys = {
	{
		key = "k",
		mods = "CMD",
		action = action.Multiple({
			action.ClearScrollback("ScrollbackAndViewport"),
			action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	{
		key = "k",
		mods = "CTRL",
		action = action.Multiple({
			action.ClearScrollback("ScrollbackAndViewport"),
			action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
}

return config
