hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
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
        kb_options = "grp:alt_shift_toggle",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true;
            disable_while_typing = true;
        }
    },
})
