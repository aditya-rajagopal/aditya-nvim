local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end
config.font_dirs = { 'fonts' }
config.color_scheme = 'Tokyo Night'

config.font = wezterm.font("Berkeley Mono Variable", { weight = "Regular", stretch = "Normal", style = "Normal" }) -- C:\USERS\ADIRA\APPDATA\LOCAL\MICROSOFT\WINDOWS\FONTS\BERKELEYMONOVARIABLE-REGULAR.TTF index=0 variation=1, DirectWrite
config.font_size = 20
config.initial_cols = 128
config.initial_rows = 38

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
-- config.hide_tab_bar_if_only_one_tab = true
config.default_cwd = "F:/"
config.max_fps = 174
config.tab_bar_at_bottom = true
config.default_prog = { 'pwsh.exe', '-NoLogo' }

local mux = wezterm.mux

wezterm.on('gui-startup', function()
    local _, _, window = mux.spawn_window {}
    window:gui_window():set_position(700, 20)
end)

wezterm.on("update-right-status", function(window, pane)
    -- Workspace name
    local stat = window:active_workspace()
    -- It's a little silly to have workspace name all the time
    -- Utilize this to display LDR or current key table name
    if window:active_key_table() then stat = window:active_key_table() end
    if window:leader_is_active() then stat = "LDR" end

    -- Current working directory
    local basename = function(s)
        -- Nothign a little regex can't fix
        return string.gsub(s, "(.*[/\\])(.*)", "%2")
    end
    local cwd = pane:get_current_working_dir().file_path
    -- Current command
    local cmd = basename(pane:get_foreground_process_name())

    -- Time
    local time = wezterm.strftime("%H:%M:%S")

    -- Let's add color to one of the components
    window:set_right_status(wezterm.format({
        -- Wezterm has a built-in nerd fonts
        { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
        { Text = " | " },
        { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
        { Text = " | " },
        { Foreground = { Color = "FFB86C" } },
        { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
        "ResetAttributes",
        { Text = " | " },
        { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
        { Text = " |" },
    }))
end)

return config
