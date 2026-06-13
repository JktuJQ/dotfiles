local colors = require("colors")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = "rgba(" .. colors.active .. "ff)",
            inactive_border = "rgba(" .. colors.inactive .. "cc)",
        },
        layout = "dwindle",
    },
    decoration = {
        rounding = 5,
        blur = {
            enabled = true,
            size = 5,
            passes = 2,
        },
    },
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:win_space_toggle",
        follow_mouse = 1,
    },
})
