{
    services.hypridle = {
        enable = true;

        settings = {
            general = {
                lock_cmd = "hyprlock";
                before_sleep_cmd = "hyprlock";
                ignore_dbus_inhibit = false;
            };

            listener = [
                {
                    timeout = 300;
                    on_timeout = "hyprctl dispatch dpms off";
                    on_resume = "hyprctl dispatch dpms on";
                }
                {
                    timeout = 600;
                    on_timeout = "hyprlock";
                }
            ];
        };
    };
}
