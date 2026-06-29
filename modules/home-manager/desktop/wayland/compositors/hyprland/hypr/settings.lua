local colors = require("colors")

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        layout = "dwindle",
        col = {
            active_border = colors.active,
            inactive_border = colors.inactive,
        },
    },
    decoration = {
        rounding = 12,
        blur = {
            enabled = true,
            size = 5,
            passes = 2,
        },
        active_opacity = 0.9;
        inactive_opacity = 0.88;
        fullscreen_opacity = 1.0;
    },
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:ctrl_shift_toggle",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
        },
        sensitivity = 0,
    },
})

hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true,
    ignore_alpha = 0.0
})
hl.layer_rule({
    match = { namespace = "logout_dialog" },
    blur = true
})

hl.device({
    name = "logitech-g102-lightsync-gaming-mouse",
    sensitivity = -0.2,
    accel_profile = "flat",
})

