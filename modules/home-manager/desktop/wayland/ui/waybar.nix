{
  config,
  pkgs,
  lib,
  ...
}:
let
  colors = config.lib.stylix.colors;
  fontName = config.stylix.fonts.monospace.name;
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "10 20 0 20";
        spacing = 0;

        modules-left = [
          "custom/nixlogo"
          "group/system"
          "hyprland/language"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "group/mpris_drawer"
          "group/audio"
          "group/light"
          "custom/connections"
          "custom/weather"
          "clock"
        ];

        "custom/nixlogo" = {
          format = "&#8194;";
          tooltip = false;
        };

        "group/system" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "temperature"
            "memory"
            "disk"
            "network#speed"
            "battery"
          ];
        };

        "cpu" = {
          format = "&#8194;  ";
          format-alt = "&#8194;  {usage}%  ";
          tooltip-format = "CPU: {usage}%";
        };
        "temperature" = {
          format = "  &#8201;  ";
          format-alt = " &#8201;  {temperatureC}°C  ";
          tooltip-format = "Temp: {temperatureC}°C";
        };
        "memory" = {
          format = "  &#8194;  ";
          format-alt = "   {percentage}%  ";
          tooltip-format = "RAM: {used:0.1f}GB / {total:0.1f}GB";
        };
        "disk" = {
          format = "  &#8194;  ";
          format-alt = "   {percentage_used}%  ";
          tooltip-format = "Disk: {used} used out of {total}";
        };
        "network#speed" = {
          format = " &#8201;󰹹  ";
          format-alt = " 󰹹 &#8201;{bandwidthDownBytes}-&#8201;{bandwidthUpBytes}  ";
          tooltip-format = "Network Traffic";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = " &#8201;{icon} ";
          format-charging = " &#8201;󰂄 ";
          format-plugged = " &#8201;󰂄 ";
          format-alt = " {icon} {capacity}% ";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "Battery: {capacity}%";
        };

        "hyprland/language" = {
          format = "{short}";
          tooltip-format = "Layout: {long}";
        };

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = [
              1
              2
              3
              4
              5
            ];
          };
          format = "{icon}{windows}";
          format-window-separator = " ";
          format-icons = {
            empty = "•";
            active = "";
            default = "";
          };
          window-rewrite-default = "&#8201;";
          window-rewrite = {
            "class<firefox>" = "&#8201;";
            "class<google-chrome>" = "&#8201;";
            "class<kitty>" = "󰄛&#8201;";
            "class<discord>" = "&#8201;";
            "class<org.telegram.desktop>" = "&#8201;";
            "class<spotify>" = "&#8201;";
            "class<code.*>" = "󰨞&#8201;";
            "class<steam>" = "&#8201;";
            "class<vlc>" = "󰕼&#8201;";
            "class<thunar>" = "&#8201;";
          };
        };

        "group/mpris_drawer" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            transition-left-to-right = false;
          };
          modules = [
            "custom/mpris_trigger"
            "custom/mpris_prev"
            "custom/mpris_play"
            "custom/mpris_next"
          ];
        };

        "custom/mpris_trigger" = {
          format = "&#8194;";
          exec = "playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null || echo 'No Music'";
          interval = 2;
          tooltip = true;
        };
        "custom/mpris_prev" = {
          format = "󰒮";
          on-click = "playerctl previous";
          tooltip = false;
        };
        "custom/mpris_play" = {
          format = "󰐊";
          on-click = "playerctl play-pause";
          tooltip = false;
        };
        "custom/mpris_next" = {
          format = "󰒭 ";
          on-click = "playerctl next";
          tooltip = false;
        };

        "group/audio" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            transition-left-to-right = false;
          };
          modules = [
            "pulseaudio"
            "pulseaudio/slider"
          ];
        };

        "pulseaudio" = {
          format = "{icon}   {format_source}";
          format-muted = "󰖁   {format_source}";
          format-source = "&#8201;";
          format-source-muted = "&#8201;";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          tooltip-format = "Volume: {volume}%\nL-Click: Mute Sound\nR-Click: Mute Mic";
        };

        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";
        };

        "group/light" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            transition-left-to-right = false;
          };
          modules = [
            "backlight"
            "backlight/slider"
          ];
        };

        "backlight" = {
          format = "{icon}";
          format-icons = [
            "&#8201;󰃞&#8194;"
            "&#8201;󰃟&#8194;"
            "&#8201;󰃠&#8194;"
          ];
          tooltip-format = "Brightness: {percent}%";
        };
        "backlight/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";
        };

        "custom/connections" = {
          format = "   &#8201;";
          on-click = "kitty -e nmtui";
          on-click-right = "blueman-manager";
          tooltip-format = "L-Click: WiFi Settings\nR-Click: Bluetooth Settings";
        };

        "custom/weather" = {
          exec = "curl -s 'https://wttr.in/?format=1'";
          interval = 1800;
          tooltip = false;
        };

        "clock" = {
          format = "&#8194; {:%H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            format = {
              months = "<span color='#${colors.base0E}'><b>{}</b></span>";
              days = "<span color='#${colors.base05}'>{}</span>";
              weeks = "<span color='#${colors.base0C}'>W{}</span>";
              weekdays = "<span color='#${colors.base0A}'><b>{}</b></span>";
              today = "<span color='#${colors.base01}' background='#${colors.base0E}'><b>{}</b></span>";
            };
          };
        };
      };
    };

    style = ''
      @define-color bg #${colors.base00};
      @define-color fg #${colors.base05};
      @define-color text-sec #${colors.base07};
      @define-color accent #${colors.base0E};

      @define-color nix-blue #7ebae4;

      @define-color bat-charge #a6e3a1;
      @define-color bat-warn #f9e2af;
      @define-color bat-crit #f38ba8;

      * {
        font-family: "${fontName}", sans-serif;
        font-weight: 700;
        font-size: 14px;
        border: none;
        box-shadow: none;
      }

      window#waybar {
        background-color: transparent;
        min-height: 40px;
      }

      window#waybar #custom-nixlogo {
        color: @nix-blue;
      }

      tooltip {
        background: alpha(@bg, 0.9);
        border: 2px solid @accent;
        border-radius: 15px;
      }
      tooltip label {
        color: @text-sec;
        padding: 5px;
      }

      window#waybar .modules-left > widget > *,
      window#waybar .modules-center > widget > *,
      window#waybar .modules-right > widget > * {
        background-color: @bg;
        color: @text-sec;
        border-radius: 20px;
        padding: 4px 14px;
        margin: 0 6px;
      }

      window#waybar .modules-left > widget > box > widget > *,
      window#waybar .modules-right > widget > box > widget > * {
        background-color: transparent;
        color: @text-sec;
        padding: 0;
        margin: 0;
      }

      drawer {
        padding: 0;
        margin: 0;
      }

      #custom-mpris_trigger, #pulseaudio, #backlight {
        padding: 0;
        background-color: transparent;
      }

      #custom-mpris_prev, #custom-mpris_play, #custom-mpris_next {
        background-color: transparent;
        font-size: 22px;
        padding: 0 8px;
        margin-right: 0px;
      }

      #pulseaudio-slider {
        margin-left: 10px;
        margin-right: 23px;
        padding: 0;
      }

      #backlight-slider {
        margin-left: 10px;
        margin-right: 20px;
        padding: 0;
      }
      scale trough {
        min-height: 10px;
        min-width: 90px;
        background-color: alpha(@text-sec, 0.2);
        border-radius: 10px;
      }
      scale highlight {
        background-color: @accent;
        border-radius: 10px;
      }

      #workspaces {
        padding: 4px 6px;
      }

      #workspaces button {
        color: @text-sec;
        border-radius: 15px;
        padding: 2px 8px 0px 8px;
        min-height: 24px;
        transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.68);
      }

      #workspaces button.active {
        background-color: @accent;
        color: @bg;
        min-width: 45px;
      }

      #workspaces button:hover {
        background-color: alpha(@accent, 0.5);
      }

      window#waybar #battery.charging,
      window#waybar #battery.plugged {
        color: @bat-charge;
      }

      window#waybar #battery.warning:not(.charging) {
        color: @bat-warn;
      }

      window#waybar #battery.critical:not(.charging) {
        color: @bat-crit;
        animation: blink 2s linear infinite;
      }

      @keyframes blink {
        to { color: @text-sec; }
      }
    '';
  };
}
