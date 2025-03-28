local wezterm = require("wezterm")
-- local action = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = "Bamboo"
config.enable_scroll_bar = true
config.max_fps = 120
config.hide_tab_bar_if_only_one_tab = true

-- Use Ctrl-l instead - keeps the tmux toolbar visible
-- config.keys = {
-- 	{
-- 		key = "k",
-- 		mods = "CMD",
-- 		action = action.Multiple({
-- 			action.ClearScrollback("ScrollbackAndViewport"),
-- 			action.SendKey({ key = "L", mods = "CTRL" }),
-- 		}),
-- 	},
-- 	-- On Windows, this prevents navigating to window above current
-- 	-- Maybe possible to fix? https://github.com/wezterm/wezterm/issues/1417
-- 	{
-- 		key = "k",
-- 		mods = "CTRL",
-- 		action = action.Multiple({
-- 			action.ClearScrollback("ScrollbackAndViewport"),
-- 			action.SendKey({ key = "L", mods = "CTRL" }),
-- 		}),
-- 	},
-- }

return config
