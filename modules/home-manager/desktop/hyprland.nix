{
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
            settings = {
                "$mod" = "SUPER";
                bind = [
                    "$mod, Return, exec, foot"
                    "$mod, Q, killactive"
                    "$mod, F, fullscreen"
                ];
                exec-once = [
                    "uwsm app -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
                ];
                monitor = [
                    ", preferred, auto, 1"
                ];
                general = {
                    gaps_in = 5;
                    gaps_out = 10;
                    border_size = 2;
                    layout = "dwindle";
                };
                decoration = {
                    rounding = 5;
                };
            };
    };
}
