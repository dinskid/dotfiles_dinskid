local wezterm = require "wezterm"

local config = wezterm.config_builder()
config.font_size = 11
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.color_scheme = 'Dracula (Gogh)'
return config
