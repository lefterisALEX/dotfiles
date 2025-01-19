local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
config.default_prog = { "/Users/lefteris/.nix-profile/bin/tmux" }
config.keys = {
	{ key = "f", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
	-- Add these to your existing keys
	{
		key = "UpArrow",
		mods = "SHIFT",
		action = act.ScrollByPage(-1), -- Scroll up one page
	},
	{
		key = "DownArrow",
		mods = "SHIFT",
		action = act.ScrollByPage(1), -- Scroll down one page
	},
	-- Search key
	{
		key = "f",
		mods = "CMD",
		action = act.Search({ CaseInSensitiveString = "" }),
	},
	-- Vertical split
	{
		key = "]",
		mods = "CMD",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Disable CMD+W default
	{
		key = "w",
		mods = "CMD",
		action = "DisableDefaultAssignment",
	},
	-- Horizontal split
	{
		key = ":",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

-- Rest of your configuration remains the same
config.font = wezterm.font("JetBrains Mono")
config.hide_mouse_cursor_when_typing = false
config.font_size = 12
config.enable_tab_bar = false
config.audible_bell = "Disabled"
config.scrollback_lines = 10000
config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 8
config.color_scheme = "Catppuccin Mocha"
-- config.disable_default_key_bindings = true

return config
