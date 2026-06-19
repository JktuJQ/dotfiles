{ config, ... }:
let
    colors = config.lib.stylix.colors;
    fontName = config.stylix.fonts.monospace.name;
in {
    programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings.mainBar = {
            layer = "top";
            position = "top";
            height = 32;
            modules-left = [ "hyprland/workspaces" ];
            modules-center = [ "clock" ];
            modules-right = [ "network" "battery" "tray" ];

            "hyprland/workspaces" = {
                disable-scroll = true;
                all-outputs = true;
            };

            clock = {
                format = "{:%H:%M}";
                tooltip-format = "{:%A, %d %B %Y}";
            };

            network = {
                format-wifi = " {signalStrength}%";
                format-ethernet = " Connected";
                format-disconnected = " Offline";
            };

            battery = {
                format = "{capacity}%";
                format-charging = " {capacity}%";
                format-full = " {capacity}%";
                states = {
                    warning = 30;
                    critical = 15;
                };
            };

            tray = {
                spacing = 10;
            };
        };

        style = ''
            * {
                font-family: "${fontName}";
                font-size: 13px;
                min-height: 0;
            }

            window#waybar {
                background: #${colors.base00};
                opacity: 0.85;
                color: #${colors.base05};
                border-bottom: 2px solid #${colors.base02};
            }

            #workspaces button {
                padding: 0 6px;
                color: #${colors.base04};
            }

            #workspaces button.active {
                color: #${colors.base05};
                border-bottom: 2px solid #${colors.base0D};
            }

            #clock {
                margin: 0 10px;
                font-weight: bold;
                color: #${colors.base0D};
            }

            #network, #battery, #tray {
                margin: 0 6px;
            }

            #battery.warning {
                color: #${colors.base0A};
            }

            #battery.critical {
                color: #${colors.base08};
            }

            #network.disconnected {
                color: #${colors.base08};
            }
        '';
    };

    stylix.targets.waybar.enable = false;
}
