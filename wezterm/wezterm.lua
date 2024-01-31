local wezterm = require 'wezterm'

config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")

-- may be helpful for VI:
-- config.use_dead_keys = false

config.color_scheme = '3024 (dark) (terminal.sexy)'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- for nvim indent blanklines' scope indicator
config.underline_position = '250%'
config.underline_thickness = '300%'

config.colors = {
  background = 'black', 

  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#000000',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#003300',
      -- The color of the text for the tab
      fg_color = '#CCCCCC',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#000000',
      fg_color = '#666666',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
      intensity = 'Normal',
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#003300',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#006600',
      fg_color = '#FFFFFF',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

return config
