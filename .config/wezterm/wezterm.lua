-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.default_prog = { '/bin/bash' } -- use non-login bash shell { '/bin/bash', '-l' } 
config.enable_wayland = false    -- I still use X11
config.check_for_updates = true  -- Check for updates every 7 days
config.check_for_updates_interval_seconds = 604800
config.color_scheme = "Dracula+" -- 'Banana Blueberry' -- 'AdventureTime'
config.window_background_opacity = .85
-- config.font = wezterm.font 'FiraCode Nerd Font' -- wezterm.font 'NotoSansMono Nerd Font'
-- REF:
--     https://github.com/wez/wezterm/issues/299
--     https://github.com/wez/wezterm/issues/1761
--     https://wezfurlong.org/wezterm/config/lua/wezterm/font_with_fallback.html#manual-fallback-scaling
-- config.font = wezterm.font_with_fallback({"FiraCode Nerd Font", {family="Microsoft YaHei", scale=1.5},})
config.font = wezterm.font_with_fallback({"Cascadia Code", "Adobe Fangsong Std"})
config.font_size = 11
config.font_shaper = 'Harfbuzz'
config.default_cursor_style = 'BlinkingBlock'
config.enable_scroll_bar = false
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 30
config.pane_focus_follows_mouse = true
config.scrollback_lines = 99999
config.window_padding = {left = 1, right = 1, top = 1, bottom = 1}


-- Custom Key Bindings
-- config.disable_default_key_bindings = true

-- SSH
-- local ssh_domains = require('extra.ssh')
-- ssh_domains = ssh_domains

-- and finally, return the configuration to wezterm
return config
