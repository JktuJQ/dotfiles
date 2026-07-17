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
          "tray"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "group/audio"
          "backlight"
          "group/network"
          "bluetooth"
          "hyprland/language"
          "custom/weather"
          "clock"
        ];

        "custom/nixlogo" = {
          format = "&#8201;&#8201;";
          tooltip = false;
          on-click = "swaync-client -t";
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
          tooltip-format = "Network Traffic: {bandwidthDownBytes} in, {bandwidthUpBytes} out";
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

        "tray" = {
          spacing = 18;
          icon-size = 16;
          show-passive = false;
        };

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "eDP-1" = [
              1
              2
              3
              4
              5
            ];
            "HDMI-A-1" = [
              8
              9
              10
              11
              12
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
            "class<vencord>" = "&#8201;";
            "class<org.telegram.desktop>" = "&#8201;";
            "class<spotify>" = "&#8201;";
            "class<code.*>" = "󰨞&#8201;";
            "class<steam>" = "&#8201;";
            "class<vlc>" = "󰕼&#8201;";
            "class<thunar>" = "&#8201;";
          };
        };

        "group/audio" = {
          orientation = "horizontal";
          modules = [
            "wireplumber#sink"
            "wireplumber#source"
          ];
        };
        "wireplumber#sink" = {
          format = "{icon}&#8194; ";
          format-muted = "󰖁&#8194; ";
          format-icons = [
            ""
            ""
            ""
          ];
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          tooltip-format = "Volume: {volume}%";
        };
        "wireplumber#source" = {
          node-type = "Audio/Source";
          format = " {icon}";
          format-muted = " 󰍭";
          format-icons = [
            "󰍬"
          ];
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          tooltip-format = "Mic: {volume}%";
        };

        "backlight" = {
          format = "{icon}&#8201;&#8202;";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          tooltip-format = "Brightness: {percent}%";
        };

        "group/network" = {
          orientation = "horizontal";
          modules = [
            "network"
            "custom/vpn"
          ];
        };
        "network" = {
          format-wifi = "{icon}&#8194; ";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          interval = 5;
          tooltip-format-wifi = "{essid}: signal {signalStrength}%";
        };
        "custom/vpn" = {
          format = " {icon}&#8201;";
          format-icons = {
            on = "󰌾";
            off = "󰌿";
          };
          return-type = "json";
          exec = ''
            if ip link show amn0 2>/dev/null | grep -q "state"; then
              echo '{"text": "on", "alt": "on"}'
            else
              echo '{"text": "off", "alt": "off"}'
            fi
          '';
          interval = 5;
          tooltip-format = "AmneziaVPN: {text}";
        };

        "bluetooth" = {
          format = "{icon}";
          format-icons = {
            enabled = "󰂯";
            disabled = "󰂲";
            connected = "󰂱";
            pairable = "󰂰";
          };
          tooltip-format = "Using: {controller_alias} ({status})";
        };

        "hyprland/language" = {
          format = "{short}";
          tooltip-format = "Layout: {long}";
        };

        "custom/weather" = {
          exec = "curl -s 'https://wttr.in/?format=1'";
          interval = 100;
          tooltip = false;
        };

        "clock" = {
          format = "&#8194; {:%H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            format = {
              months = "<span color='#${colors.base0D}'><b>{}</b></span>";
              days = "<span color='#${colors.base05}'>{}</span>";
              weeks = "<span color='#${colors.base0C}'>W{}</span>";
              weekdays = "<span color='#${colors.base0A}'><b>{}</b></span>";
              today = "<span color='#${colors.base01}' background='#${colors.base0D}'><b>{}</b></span>";
            };
          };
        };
      };
    };

    style = ''
      @define-color bg #${colors.base00};
      @define-color fg #${colors.base05};
      @define-color text-sec #${colors.base07};
      @define-color accent #${colors.base0D};

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
      window#waybar .modules-right > widget > box > widget > * {
        padding: 0 2px;
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

      window#waybar #battery.charging,
      window#waybar #battery.plugged {
        color: @bat-charge;
      }
      window#waybar #battery.warning:not(.charging) {
        color: @bat-warn;
      }
      window#waybar #battery.critical:not(.charging) {
        color: @bat-crit;
      }
    '';
  };

  stylix.targets.waybar.enable = false;
}
