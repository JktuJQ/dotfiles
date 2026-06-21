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
        height = 42;
        spacing = 6;

        modules-left = [
          "custom/distro"
          "group/storage"
          "group/system"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "group/audio"
          "group/connections"
          "hyprland/language"
          "battery"
          "clock"
        ];

        "group/storage" = {
          orientation = "horizontal";
          modules = [
            "disk"
            "memory"
          ];
        };

        "group/system" = {
          orientation = "horizontal";
          modules = [
            "temperature"
            "cpu"
          ];
        };

        "group/audio" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 650;
            transition-left-to-right = false;
          };
          modules = [
            "pulseaudio"
            "pulseaudio/slider"
            "pulseaudio#microphone"
          ];
        };

        "group/connections" = {
          orientation = "horizontal";
          modules = [
            "network"
            "bluetooth"
          ];
        };

        "custom/distro" = {
          format = "󱄅";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{icon}{windows}";
          on-click = "activate";
          persistent-workspaces = {
            "*" = 5;
          };
          window-rewrite-default = "";
          window-rewrite = {
            "kitty" = "󰆍";
            "Alacritty" = "󰆍";
            "foot" = "󰆍";
            "nvim" = "󰨞";
            "code" = "󰨞";
            "codium" = "󰨞";
            "thunar" = "";
            "nautilus" = "";
            "dolphin" = "";
            "firefox" = "";
            "zen" = "";
            "chromium" = "";
            "brave" = "";
            "obsidian" = "󰹕";
            "discord" = "󰙯";
            "spotify" = "󰓇";
            "blueman-manager" = "󰂯";
            "pavucontrol" = "󰕾";
            "nm-connection-editor" = "󰤨";
          };
          format-icons = {
            active = "";
            special = "";
            default = "";
            urgent = "";
            empty = "󱄅";
          };
          show-special = true;
          all-outputs = true;
        };

        "hyprland/language" = {
          format = "{short}";
          tooltip-format = "Keyboard layout: {short}";
        };

        "network" = {
          format-wifi = "󰤨";
          format-ethernet = "󰤥";
          format-linked = "󰤢";
          format-disconnected = "󰤭";
          format-disabled = "󰤮";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          tooltip-format-disconnected = "No Connection";
          tooltip-format-disabled = "Wi-Fi is OFF";
          tooltip-format-wifi = " {essid} ({signalStrength}%)\n\n Freq: {frequency}GHz\n {bandwidthDownBytes} {bandwidthUpBytes}";
          tooltip-format-ethernet = " {ifname} (Connected)\n {bandwidthDownBytes} {bandwidthUpBytes}";
          tooltip-format-linked = " {ifname}: No IP Address";
          on-click = "nm-connection-editor";
          on-scroll-up = "nmcli radio wifi on";
          on-scroll-down = "nmcli radio wifi off";
        };

        "bluetooth" = {
          format = "󰂯";
          format-connected = "󰂱";
          format-disabled = "󰂲";
          tooltip-format = "{controller_alias} {status}";
          tooltip-format-connected = " {num_connections} Connected:\n{device_enumerate}";
          tooltip-format-enumerate-connected-battery = " {device_alias} ({device_battery_percentage}%)";
          on-click = "blueman-manager";
          on-click-right = "rfkill toggle bluetooth";
        };

        "battery" = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-full = "󰁹 {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-alt = "{icon} {time}";
          tooltip-format = "{timeTo}\n\n Usage: {power:0.1f}W\n Condition: {health}%\n Total: {cycles} cycles";
          format-icons = {
            default = [
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
          };
        };

        "clock" = {
          timezone = "Europe/Moscow";
          format = "󰃱 {:%H:%M}";
          format-alt = "󰃰 {:%d %B %Y}";
          tooltip-format = "{calendar}";
        };

        "disk" = {
          tooltip = false;
          interval = 3600;
          path = "/";
          format = "󱙋";
          format-alt = "󱙋 {used}";
          states = {
            warning = 80;
            critical = 90;
          };
        };

        "memory" = {
          tooltip = false;
          interval = 15;
          format = "󰘚";
          format-alt = "󰘚 {used} GiB";
          states = {
            warning = 75;
            critical = 85;
          };
        };

        "cpu" = {
          tooltip = false;
          interval = 10;
          format = "󰍛";
          format-alt = "󰍛 {usage}%";
          states = {
            warning = 75;
            critical = 90;
          };
        };

        "temperature" = {
          tooltip = false;
          interval = 10;
          thermal-zone = 8;
          critical-threshold = 80;
          format = "{icon}";
          format-alt = "{icon} {temperatureC}°C";
          format-critical = "󱗗 {temperatureC}°C";
          format-icons = [
            ""
            ""
            ""
          ];
        };

        "pulseaudio" = {
          format = "{icon}";
          format-muted = "󰝟";
          format-icons = {
            headphone = "󰋋";
            headset = "󰋎";
            hands-free = "󰋊";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
          tooltip-format = "Output: {volume}%";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 {volume}%";
          on-click = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          tooltip = false;
        };

        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";
        };
      };
    };

    style = ''
      @define-color background #${colors.base00};
      @define-color surface_container #${colors.base01};
      @define-color primary #${colors.base0D};
      @define-color on_primary #${colors.base00};
      @define-color outline_variant #${colors.base02};
      @define-color surface_container_highest #${colors.base02};

      @define-color text_default #${colors.base07};

      * {
          font-family: "${fontName}";
          margin: 0;
          padding: 0;
          min-height: 0px;
          border: none;
          border-radius: 0;
      }

      window#waybar {
          background: transparent;
      }

      #custom-distro, #battery, #clock, #language, #audio, #connections,
      #system, #storage, #workspaces {
          margin: 4px 5px;
          background-color: @surface_container;
          border-radius: 20px;
      }

      #audio, #connections, #system, #storage {
          padding: 6px 6px;
      }

      #custom-distro, #clock, #language, #battery {
          padding: 6px 16px;
      }

      #workspaces {
          padding: 4px 6px;
      }

      #disk, #memory, #cpu, #temperature, #bluetooth, #network, #language, #clock, #battery {
          color: @text_default;
      }

      #custom-distro {
          color: @primary;
      }

      #battery.charging,
      #battery.plugged,
      #battery.full {
          color: #40a02b;
      }

      #battery.warning:not(.charging),
      #cpu.warning,
      #disk.warning,
      #memory.warning {
          color: #fe640b;
      }

      #battery.critical:not(.charging),
      #network.disabled,
      #cpu.critical,
      #disk.critical,
      #memory.critical,
      #temperature.critical {
          color: #d20f39;
      }

      #pulseaudio {
          margin-right: 12px;
          margin-left: 8px;
          color: @text_default;
      }

      #pulseaudio-slider {
          margin: 4px 5px;
          padding: 0 2px;
          background-color: transparent;
          border-radius: 20px;
      }

      #pulseaudio-slider trough {
          min-height: 10px;
          min-width: 80px;
          border-radius: 10px;
          background-color: @outline_variant;
      }

      #pulseaudio-slider highlight {
          min-height: 10px;
          border-radius: 10px;
          background-color: @text_default;
      }

      #pulseaudio-slider slider {
          min-height: 12px;
          min-width: 12px;
          margin: -2px 0;
          border-radius: 100%;
          background-color: @primary;
      }

      #pulseaudio-microphone {
          margin-right: 8px;
          margin-left: 12px;
          color: @text_default;
      }

      #disk, #memory, #cpu, #temperature  {
          margin-right: 2px;
          padding: 0 8px;
      }

      #bluetooth  {
          padding: 0 6px;
      }

      #network {
          padding: 1px 10px 0px 4px;
      }

      #workspaces button {
          padding: 0 8px;
          margin: 0 2px;
          background: transparent;
          border-radius: 16px;
          color: @text_default;
          transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
          border: none;
          outline: none;
          box-shadow: none;
      }

      #workspaces button label {
          margin: 0;
          padding: 0;
      }

      #workspaces button.empty {
          padding: 0 5px 0 9px;
          color: @outline_variant;
      }

      #workspaces button.active {
          padding: 0 12px;
          margin: 0 2px;
          background-color: @primary;
          color: @on_primary;
      }

      #workspaces button:hover {
          background-color: @surface_container_highest;
          color: @primary;
      }

      #workspaces button.active:hover {
          background-color: @primary;
          color: @on_primary;
      }

      #workspaces button.urgent {
          color: #d20f39;
      }

      tooltip {
          background: @surface_container;
          border: 1px solid @primary;
          border-radius: 16px;
          padding: 6px 10px;
      }

      tooltip label {
          color: @text_default;
          padding: 4px;
      }
    '';
  };

  stylix.targets.waybar.enable = false;
}
