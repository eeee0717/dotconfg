local wezterm = require("wezterm")

local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().active
	local ratio = 0.7
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window({
		position = {
			x = (screen.width - width) / 2,
			y = (screen.height - height) / 2,
			origin = "ActiveScreen",
		},
	})
	-- window:gui_window():maximize()
	window:gui_window():set_inner_size(width, height)
end)
config = {
	initial_cols = 120,
	initial_rows = 30,
	automatically_reload_config = true,
	default_cursor_style = "BlinkingBar",
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	font_size = 17,
	font = wezterm.font("JetBrains Mono"),
	window_background_opacity = 0.7,
	macos_window_background_blur = 70,
}
local act = wezterm.action
config.keys = {
	{
		key = "c",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = " " }),
			act.SendKey({ key = "c" }),
		}),
	},

	{
		key = "[",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = " " }),
			act.SendKey({ key = "p" }),
		}),
	},
	{
		key = "]",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = " " }),
			act.SendKey({ key = "n" }),
		}),
	},
	{
		key = "%",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = " " }),
			act.SendKey({ key = "%" }),
		}),
	},
	{
		key = "x",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = " " }),
			act.SendKey({ key = "x" }),
		}),
	},
	{ mods = "OPT", key = "LeftArrow", action = act.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = act.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = act.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = act.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
	{ mods = "CMD|ALT", key = "LeftArrow", action = act.ActivateTabRelative(-1) },
	{ mods = "CMD|ALT", key = "RightArrow", action = act.ActivateTabRelative(1) },
}
return config
