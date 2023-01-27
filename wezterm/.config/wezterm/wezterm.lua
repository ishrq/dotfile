-- Author: IA
-- Machine: PC


local wezterm = require 'wezterm'
local act = wezterm.action

local config = {

    -- GENERAL

    -- default_prog = { '/usr/bin/fish', '-l' },
    check_for_updates = false,
    adjust_window_size_when_changing_font_size = false,

    -- DISPLAY

    color_scheme = "astromouse (terminal.sexy)",
    inactive_pane_hsb = { hue = 1.0, saturation = 0.4, brightness = 0.9 },
    hide_tab_bar_if_only_one_tab = true,
    window_padding = { left = 2, right = 0, top = 0, bottom = 0, },
    font_size = 17,
    font = wezterm.font_with_fallback { 'DroidSansMono Nerd Font', 'Fira Code', },

    -- KEYMAP

    disable_default_key_bindings = true,
    leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },

    keys = {

        -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
        { key = 'a', mods = 'LEADER|CTRL', action = act.SendString '\x01', },

        -- { key = 'a', mods = 'LEADER', action = act.ShowLauncher },
        { key = '/', mods = 'LEADER', action = act.Search { CaseInSensitiveString = '' }, },

        { key = 'v', mods = 'CTRL|SHIFT', action="Paste"},
        { key = 'c', mods = 'CTRL|SHIFT', action="Copy"},

        { key = 'k', mods = 'CTRL|SHIFT', action = act.ScrollByLine(-1) },
        { key = 'j', mods = 'CTRL|SHIFT', action = act.ScrollByLine(1) },

        { key = '0', mods = 'CTRL', action=act.ResetFontSize},
        { key = '=', mods = 'CTRL', action=act.IncreaseFontSize},
        { key = '-', mods = 'CTRL', action=act.DecreaseFontSize},

        { key = 'x', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
        { key = 's', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
        { key = '[', mods = 'ALT', action = act.ActivatePaneDirection 'Prev', },
        { key = ']', mods = 'ALT', action = act.ActivatePaneDirection 'Next', },
        { key = '[', mods = 'LEADER', action = act.RotatePanes 'CounterClockwise', },
        { key = ']', mods = 'LEADER', action = act.RotatePanes 'Clockwise' },
        { key = 'h', mods = 'LEADER', action = act.AdjustPaneSize { 'Left', 5 }, },
        { key = 'j', mods = 'LEADER', action = act.AdjustPaneSize { 'Down', 5 }, },
        { key = 'k', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
        { key = 'l', mods = 'LEADER', action = act.AdjustPaneSize { 'Right', 5 }, },
        { key = 'z', mods = 'LEADER', action="TogglePaneZoomState" },

        { key = 't', mods = 'LEADER', action=act{SpawnTab="CurrentPaneDomain"}},
        { key = '1', mods = 'LEADER', action=act{ActivateTab=0}},
        { key = '2', mods = 'LEADER', action=act{ActivateTab=1}},
        { key = '3', mods = 'LEADER', action=act{ActivateTab=2}},
        { key = '4', mods = 'LEADER', action=act{ActivateTab=3}},
        { key = '5', mods = 'LEADER', action=act{ActivateTab=4}},
        { key = '6', mods = 'LEADER', action=act{ActivateTab=5}},
        { key = '7', mods = 'LEADER', action=act{ActivateTab=6}},
        { key = '8', mods = 'LEADER', action=act{ActivateTab=7}},
        { key = '9', mods = 'LEADER', action=act{ActivateTab=8}},
        { key = 'Tab', mods = 'CTRL', action = 'ActivateLastTab' },
    },

    mouse_bindings = {
        {
            -- CTRL-Click open hyperlinks
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = 'OpenLinkAtMouseCursor'
        },
        {
            -- Paste on right-click
            event = { Down = { streak = 1, button = 'Right' } },
            mods = 'NONE',
            action = act { PasteFrom = 'Clipboard' }
        },
    },
}

return config
