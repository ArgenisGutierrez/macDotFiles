-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

--Configs

--Font
config.font = wezterm.font("FiraMono Nerd Font")
config.font_size = 20

--Window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.4
config.macos_window_background_blur = 5
config.scrollback_lines = 50000

--Color Scheme
config.color_scheme = 'Ayu Dark (Gogh)'

return config
