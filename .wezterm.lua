-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Terminal color scheme
config.colors = {
	foreground = "#e0def4", -- Set the foreground color (Text)
	background = "#0d0c15", -- Base más oscuro (Rosé Pine Dawn)
	cursor_bg = "#c4a7e7", -- Set the cursor background color (Iris)
	cursor_fg = "#e0def4", -- Set the cursor foreground color (Text)
	cursor_border = "#c4a7e7", -- Set the cursor border color (Iris)
	selection_fg = "#e0def4", -- Set the selection foreground color (Text)
	selection_bg = "#393552", -- Set the selection background color (Overlay)
	scrollbar_thumb = "#2a273f", -- Set the scrollbar thumb color (Surface)
	split = "#2a273f", -- Set the split color (Surface)
	ansi = {
		"#232136", -- Base
		"#eb6f92", -- Love
		"#9ccfd8", -- Foam
		"#f6c177", -- Gold
		"#3e8fb0", -- Pine
		"#c4a7e7", -- Iris
		"#ea9a97", -- Rose
		"#e0def4", -- Text
	}, -- Set the ANSI color palette
	brights = {
		"#56526e", -- Highlight High
		"#eb6f92", -- Love
		"#9ccfd8", -- Foam
		"#f6c177", -- Gold
		"#3e8fb0", -- Pine
		"#c4a7e7", -- Iris
		"#ea9a97", -- Rose
		"#e0def4", -- Text
	}, -- Set the bright color palette
	indexed = {
		[16] = "#f6c177", -- Gold
		[17] = "#ea9a97", -- Rose
	}, -- Set additional indexed colors
}

-- This is where you actually apply your config choices
config.window_padding = {
	bottom = 0,
	top = 0,
	right = 0,
	left = 0,
}

config.colors = {}
config.colors.foreground = "#dcd7ba"
config.colors.background = "#181616"
config.colors.cursor_bg = "#c8c093"
config.colors.cursor_fg = "#c8c093"
config.colors.cursor_border = "#c8c093"
config.colors.selection_fg = "#c8c093"
config.colors.selection_bg = "#2d4f67"
config.colors.scrollbar_thumb = "#16161d"
config.colors.split = "#16161d"
config.colors.ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" }
config.colors.brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" }
config.colors.indexed = { [16] = "#ffa066", [17] = "#ff5d62" }
--  change

-- Background
config.window_background_opacity = 0.75 -- Adjust this value as needed
config.macos_window_background_blur = 5 -- Adjust this value as needed

-- UI
config.font = wezterm.font("FiraMono Nerd Font")
config.font_size = 20
config.enable_tab_bar = false
config.max_fps = 240 -- hack for smoothness

-- Plugins
-- Integración del plugin modal.wezterm
local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
modal.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
