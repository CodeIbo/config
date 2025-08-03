local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux
local color_schema = "Windows High Contrast (base16)"
local font = wezterm.font({ family = "IBM Plex Mono", weight = "Regular" })

local config = wezterm.config_builder()

-- full mode screen
-- wezterm.on("gui-startup", function()
--   local tab, pane, window = mux.spawn_window {}
--   window:gui_window():maximize()
-- end)

--cursor
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 350


-- https://wezterm.org/colorschemes ~ have fun  
config.color_scheme = color_schema
config.colors = {
  background = "#0c0b0f", 
  cursor_border = "FFB1C7A3",

  cursor_bg = "FFE9DB5B",

  tab_bar = {
    background = "#0c0b0f",
    active_tab = {
      bg_color = "#0c0b0f",
      fg_color = "#bea3c7",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = "#0c0b0f",
      fg_color = "#f8f2f5",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    new_tab = {
      bg_color = "#0c0b0f",
      fg_color = "white",
    },
  },
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false



config.keys = {
  {
    key = "v",
    mods = "CTRL",
    action = act.PasteFrom("Clipboard"),
  },

  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = act.SplitPane({
      direction = "Left",
      size = { Percent = 50 },
    }),
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = act.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = act.SplitPane({
      direction = "Up",
      size = { Percent = 50 },
    }),
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = act.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },

  {
    key = "x",
    mods = "CTRL|SHIFT",
    action = act.CloseCurrentPane({ confirm = false }),
  },

  { key = "LeftArrow",  mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
  {
    key = "UpArrow",
    mods = "CTRL|ALT",
    action = act.ScrollByLine(-1),
  },
  {
    key = "DownArrow",
    mods = "CTRL|ALT",
    action = act.ScrollByLine(1),
  },
  {
    key = 'r',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },
  { 
    key = 'x', 
    mods = 'CTRL', 
    action = wezterm.action.ActivateCopyMode 
  },
  

}

config.window_frame = {
  font = font,
  active_titlebar_bg = "#0c0b0f",
}

config.font = font


config.window_decorations = "NONE | RESIZE"
config.default_prog = { "powershell.exe", "-NoLogo" }
config.initial_cols = 80
config.window_background_opacity = 0.85
config.prefer_egl = true
config.font_size = 18.0

return config
