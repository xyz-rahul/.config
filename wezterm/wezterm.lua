local wezterm = require("wezterm")

local config = {}

config.font_size = 14
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
		weight = "Medium",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{ family = "Terminus", weight = "Bold" },
	"Noto Color Emoji",
})
config.color_scheme = "Seti UI (base16)"

config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 10,
	right = 10,
	top = 20,
	bottom = 0,
}

-- remove winodow buttons
-- config.window_decorations = "NONE|RESIZE"

config.integrated_title_buttons = { "Close" }
-- Define settings for each image separately
local background_images = {
	{
		source = { File = "/Users/rahulkumar/Downloads/makima.png" },
		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		hsb = { brightness = 0.25, hue = 1, saturation = 1 },
		opacity = 1,
	},
	{
		source = { File = "/Users/rahulkumar/Downloads/makima1.jpg" },
		repeat_x = "Repeat",
		vertical_align = "Top",
		hsb = { brightness = 0.07, hue = 1, saturation = 1 },
		opacity = 1,
	},
}

local background_index = 1

local function cycle_background(window, pane)
	background_index = background_index % #background_images + 1
	local overrides = window:get_config_overrides() or {}
	overrides.background = { background_images[background_index] }
	wezterm.GLOBAL.background_empty = false
	window:set_config_overrides(overrides)
end

wezterm.on("cycle-background", cycle_background)

wezterm.on("toggle-background", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if wezterm.GLOBAL.background_empty == true then
		overrides.background = { background_images[background_index] }
		wezterm.GLOBAL.background_empty = false
	else
		wezterm.GLOBAL.background_empty = true
		overrides.background = {}
	end
	window:set_config_overrides(overrides)
end)

local opacities = { 1, 0.75, 0.5, 0.25 }
local opacity_index = 1

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_background_opacity then
		opacity_index = opacity_index % #opacities + 1
		overrides.window_background_opacity = opacities[opacity_index]
	else
		overrides.window_background_opacity = opacities[1]
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "o",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
	{
		key = "m",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("cycle-background"),
	},
	{
		key = "M",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-background"),
	},
    --macos treating cmd as alt
	{
		key = "f",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "f", mods = "ALT" }),
	},
	{
		key = "b",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "b", mods = "ALT" }),
	},
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "c", mods = "ALT" }),
	},
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "h", mods = "ALT" }),
	},
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "j", mods = "ALT" }),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "k", mods = "ALT" }),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "l", mods = "ALT" }),
	},
}

return config
