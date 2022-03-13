local wezterm = require 'wezterm';
return {
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,

  window_background_opacity = 0.95,

  color_scheme = "GitHub Dark",

  font = wezterm.font("Monaco", {weight="Bold"}),
  harfbuzz_features = {"calt=0", "clig=0", "liga=0"},
  font_size = 14,
  default_cursor_style = "SteadyBar",
}
