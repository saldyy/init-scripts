-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font('JetBrains Mono', { italic = false })
config.inactive_pane_hsb = {
  saturation = 0.5,
}

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

-- Key mappings
config.leader = { key = 'g', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '%',
    mods = 'LEADER',
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = '"',
    mods = 'LEADER',
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = act.TogglePaneZoomState,
  },
  -- Leader, followed by 'r' will put us in resize-pane
  -- mode until we cancel that mode.
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },
  -- Tab controls
  {
    key = 'c',
    mods = 'LEADER',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },

  -- Pane controls
  -- Leader, followed by 'a' will put us in activate-pane
  -- mode until we press some other key or until 1 second (1000ms)
  -- of time elapses
  {
    key = 'a',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'activate_pane',
      timeout_milliseconds = 1000,
    },
  },
  {
    key = 'q',
    mods = 'LEADER',
    action = act.PaneSelect { alphabet = '0123456789' },
  },
  {
    key = ' ',
    mods = 'LEADER',
    action = act.RotatePanes 'Clockwise',
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Down',
  },
}
--
-- and finally, return the configuration to wezterm
return config
