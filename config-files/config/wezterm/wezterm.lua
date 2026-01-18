-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.font =
    wezterm.font('JetBrains Mono', { italic = false })

-- Changing the color scheme:
config.color_scheme = 'Dracula (Official)'
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

-- config.key_tables = {
--   -- Defines the keys that are active in our resize-pane mode.
--   -- Since we're likely to want to make multiple adjustments,
--   -- we made the activation one_shot=false. We therefore need
--   -- to define a key assignment for getting out of this mode.
--   -- 'resize_pane' here corresponds to the name="resize_pane" in
--   -- the key assignments above.
--   resize_pane = {
--     { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
--     { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },
--
--     { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
--     { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },
--
--     { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
--     { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },
--
--     { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
--     { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },
--
--     -- Cancel the mode by pressing escape
--     { key = 'Escape',     action = 'PopKeyTable' },
--   },
--
--   -- Defines the keys that are active in our activate-pane mode.
--   -- 'activate_pane' here corresponds to the name="activate_pane" in
--   -- the key assignments above.
--   activate_pane = {
--     { key = 'LeftArrow',  action = act.ActivatePaneDirection 'Left' },
--     { key = 'h',          action = act.ActivatePaneDirection 'Left' },
--
--     { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
--     { key = 'l',          action = act.ActivatePaneDirection 'Right' },
--
--     { key = 'UpArrow',    action = act.ActivatePaneDirection 'Up' },
--     { key = 'k',          action = act.ActivatePaneDirection 'Up' },
--
--     { key = 'DownArrow',  action = act.ActivatePaneDirection 'Down' },
--     { key = 'j',          action = act.ActivatePaneDirection 'Down' },
--   },
-- }

-- Key mappings
-- config.leader = { key = 'g', mods = 'CTRL', timeout_milliseconds = 1000 }
-- config.keys = {
--   {
--     key = 'h',
--     mods = 'LEADER',
--     action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
--   },
--   {
--     key = 'v',
--     mods = 'LEADER',
--     action = act.SplitVertical { domain = "CurrentPaneDomain" },
--   },
--   {
--     key = 'z',
--     mods = 'LEADER',
--     action = act.TogglePaneZoomState,
--   },
--
--   -- Leader, followed by 'r' will put us in resize-pane
--   -- mode until we cancel that mode.
--   {
--     key = 'r',
--     mods = 'LEADER',
--     action = act.ActivateKeyTable {
--       name = 'resize_pane',
--       one_shot = false,
--     },
--   },
--
--   -- Leader, followed by 'a' will put us in activate-pane
--   -- mode until we press some other key or until 1 second (1000ms)
--   -- of time elapses
--   {
--     key = 'a',
--     mods = 'LEADER',
--     action = act.ActivateKeyTable {
--       name = 'activate_pane',
--       timeout_milliseconds = 1000,
--     },
--   },
--   {
--     key = 'q',
--     mods = 'LEADER',
--     action = act.PaneSelect { alphabet = '0123456789' },
--   },
--   {
--     key = ' ',
--     mods = 'LEADER',
--     action = act.RotatePanes 'Clockwise',
--   },
-- }
--
-- and finally, return the configuration to wezterm
return config
