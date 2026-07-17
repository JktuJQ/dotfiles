{ config, ... }:
let
  colors = config.lib.stylix.colors;
  font = config.stylix.fonts.monospace.name;
in
{
  services.swaync = {
    enable = true;

    settings = {
      positionX = "left";
      positionY = "top";
      control-center-positionX = "left";
      control-center-positionY = "top";

      control-center-margin-top = 5;
      control-center-margin-bottom = 5;
      control-center-margin-right = 5;
      control-center-margin-left = 5;

      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;

      timeout = 3;
      timeout-low = 2;
      timeout-critical = 0;

      fit-to-screen = true;
      control-center-width = 446;
      control-center-height = 1010;
      notification-window-width = 440;

      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;

      widgets = [
        "title"
        "dnd"
        "notifications"
        "mpris"
        "volume"
        "backlight"
        "buttons-grid"
      ];

      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰆴 Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        mpris = {
          image-size = 96;
          image-radius = 7;
        };
        volume = {
          label = "";
          show-per-app = false;
        };
        backlight = {
          label = "󰃟";
        };
        "buttons-grid" = {
          actions = [
            {
              label = "󰭷";
              command = "kitty -e btop";
              tooltip = "System Monitor";
            }
            {
              label = "󰕾";
              command = "pavucontrol";
              tooltip = "Audio Settings";
            }
            {
              label = "󰤨";
              command = "kitty -e nmtui";
              tooltip = "WiFi Settings";
            }
            {
              label = "󰌾";
              command = "AmneziaVPN";
              tooltip = "VPN";
            }
            {
              label = "󰂯";
              command = "blueman-manager";
              tooltip = "Bluetooth Manager";
            }
            {
              label = "󰪚";
              command = "qalculate-gtk";
              tooltip = "Calculator";
            }
            {
              label = "";
              command = "obsidian daily";
              tooltip = "Notes";
            }
            {
              label = "";
              command = "hyprpicker -a";
              tooltip = "Color Picker";
            }
            {
              label = "";
              command = "hyprshot -m region --clipboard-only --freeze";
              tooltip = "Screenshot";
            }
            {
              label = "󰗼";
              command = "wlogout";
              tooltip = "Logout Menu";
            }
          ];
        };
      };
    };

    style = ''
      @define-color bg #${colors.base00};
      @define-color bg-darker #${colors.base01};
      @define-color fg #${colors.base05};
      @define-color text-sec #${colors.base07};
      @define-color accent #${colors.base0D};
      @define-color border #${colors.base02};
      @define-color red #${colors.base08};
      @define-color green #${colors.base0B};
      @define-color surface #${colors.base01};
      @define-color surface-bright #${colors.base03};

      * {
        font-family: "${font}";
        font-weight: bold;
        font-size: 14px;
      }

      .image, .icon, .app-icon {
          margin-left: -4px;
          margin-right: 16px;
      }

      .control-center {
        background: alpha(@bg, 0.92);
        border: 2px solid @accent;
        border-radius: 30px;
      }

      .control-center-list {
        background: transparent;
      }

      .control-center-list-placeholder {
        opacity: .5;
      }

      .notification-row {
        margin: 20px;
        padding: 0;
        background: transparent;
        outline: none;
      }

      .notification {
        background: transparent;
        margin: 0;
        padding: 0;
        border: none;
      }

      .notification-content {
        background: alpha(@bg-darker, 0.9);
        padding: 10px 14px;
        border-radius: 20px;
        border: none;
        margin: 0;
      }

      .notification-default-action {
        background: transparent;
        color: @fg;
        border: none;
      }

      .notification-default-action:hover {
        background: transparent;
        color: @fg;
      }

      .close-button {
        background: @red;
        color: @bg;
        border-radius: 20px;
        min-width: 24px;
        min-height: 24px;
        border: none;
        opacity: 0;
        transition: opacity 0.2s ease;
        padding: 0;
        margin: 5px 5px 0 0;
      }

      .notification:hover .close-button {
        opacity: 1;
      }

      .close-button:hover {
        background: alpha(@red, 0.7);
      }

      .notification-action {
        color: @fg;
        border: none;
        border-radius: 20px;
        background: alpha(@bg, 0.5);
        padding: 4px 12px;
        margin: 4px 2px;
      }

      .notification-action:hover {
        background: alpha(@bg-darker, 0.9);
        color: @fg;
      }

      .summary {
        padding-top: 4px;
        font-size: 14px;
        color: @fg;
        font-weight: bold;
      }

      .time {
        font-size: 12px;
        color: alpha(@fg, 0.6);
        margin-right: 16px;
      }

      .body {
        font-size: 13px;
        color: alpha(@fg, 0.8);
        margin-top: 2px;
      }

      .notification-group {
        border-radius: 20px;
        padding: 10px 12px;
        background: alpha(@bg-darker, 0.3);
        margin: 5px 0;
        border: none;
      }

      .notification-group-header {
        font-size: 13px;
        color: @fg;
        font-weight: bold;
      }

      .notification-group-buttons button {
        border-radius: 9999px;
        background: alpha(@bg, 0.85);
        color: @fg;
        border: none;
        padding: 2px 10px;
        margin-left: 6px;
      }

      .notification-group-buttons button:hover {
        background: alpha(@bg-darker, 0.9);
      }

      .notification-group-buttons button:last-child {
        background: alpha(@red, 0.85);
        color: @bg;
      }

      .notification-group-buttons button:last-child:hover {
        background: @red;
      }

      .control-center .control-center-list .notification-group .notification-row,
      .control-center .control-center-list .notification-group .notification-background {
        background-color: transparent;
        box-shadow: none;
        border: none;
      }

      .notification-group .notification-content,
      .notification-group .notification-default-action .notification-content {
        background: alpha(@bg-darker, 0.9);
        padding: 10px 14px;
        border-radius: 20px;
        border: none;
        margin: 0;
      }

      .notification-group .notification-default-action {
        border: none;
        background: transparent;
      }

      .notification-group .notification-default-action:hover {
        background: transparent;
      }

      .notification-group .notification {
        background: alpha(@bg-darker, 0.9);
        border: none;
        border-radius: 20px;
        padding: 10px 14px;
        margin: 0;
      }

      .image,
      .app-icon,
      .body-image {
        border-radius: 7px;
      }

      .floating-notifications.background .notification-row {
        margin: 12px;
        padding: 0;
        background: transparent;
      }

      .floating-notifications.background .notification-background {
        background: transparent;
        border: none;
        border-radius: 20px;
      }

      .floating-notifications.background .notification {
        background: alpha(@bg-darker, 0.9);
        border: none;
        border-radius: 20px;
        padding: 10px 14px;
        margin: 0;
      }

      .floating-notifications.background .notification .notification-content {
        background: transparent;
        padding: 0;
        border: none;
        border-radius: 0;
      }

      .floating-notifications.background .notification-default-action {
        background: transparent;
        color: @fg;
        border: none;
      }

      .floating-notifications.background .notification-default-action:hover {
        background: transparent;
        color: @fg;
      }

      .floating-notifications.background .close-button {
        background: @red;
        color: @bg;
        border-radius: 20px;
        min-width: 24px;
        min-height: 24px;
        border: none;
        opacity: 0;
        transition: opacity 0.2s ease;
        padding: 0;
        margin: 5px;
      }

      .floating-notifications.background .notification-row:hover .close-button {
        opacity: 1;
      }

      .floating-notifications.background .close-button:hover {
        background: alpha(@red, 0.7);
      }

      .floating-notifications.background .notification-action {
        color: @fg;
        border: none;
        border-radius: 20px;
        background: alpha(@bg, 0.5);
        padding: 4px 12px;
        margin: 4px 2px;
      }

      .floating-notifications.background .notification-action:hover {
        background: alpha(@bg-darker, 0.9);
        color: @fg;
      }

      .floating-notifications.background .summary {
        font-size: 14px;
        color: @fg;
        font-weight: bold;
      }

      .floating-notifications.background .time {
        font-size: 12px;
        color: alpha(@fg, 0.6);
        margin-right: 16px;
      }

      .floating-notifications.background .body {
        font-size: 13px;
        color: alpha(@fg, 0.8);
        margin-top: 2px;
      }

      .widget-title {
        color: @fg;
        background: alpha(@bg-darker, 0.7);
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        font-size: 1.5rem;
        border-radius: 20px;
      }

      .widget-title > button {
        font-size: 1rem;
        color: @fg;
        text-shadow: none;
        background: alpha(@bg, 0.85);
        box-shadow: none;
        border-radius: 20px;
      }

      .widget-title > button:hover {
        background: @accent;
        color: @bg;
      }

      .widget-dnd {
        background: alpha(@bg-darker, 0.7);
        padding: 5px 10px;
        margin: 5px 10px 10px 10px;
        border-radius: 20px;
        font-size: large;
        color: @fg;
      }

      .widget-dnd > switch {
        border-radius: 20px;
        background: @border;
        border: 2px solid @bg-darker;
        min-height: 24px;
        min-width: 44px;
      }

      .widget-dnd > switch:hover {
        background: @border;
        border-color: @bg-darker;
      }

      .widget-dnd > switch:checked {
        background: @accent;
        border: 2px solid @accent;
      }

      .widget-dnd > switch slider {
        background: @bg;
        border-radius: 20px;
        min-height: 18px;
        min-width: 18px;
        margin: 2px;
      }

      .widget-dnd > switch:checked slider {
        background: @bg;
        border-radius: 20px;
        min-height: 18px;
        min-width: 18px;
        margin: 2px;
      }

      .widget-mpris {
        color: @fg;
        background: alpha(@bg-darker, 0.7);
        padding: 5px 10px 0;
        margin: 5px 10px 5px 10px;
        border-radius: 20px;
        min-height: 80px;
      }

      .widget-mpris > box > button {
        border-radius: 20px;
      }

      .widget-mpris-player {
        padding: 5px;
        margin: 7px;
      }

      .widget-mpris-title {
        font-weight: 700;
        font-size: 1.25rem;
      }

      .widget-mpris-subtitle {
        font-size: 1.1rem;
      }

      .widget-volume,
      .widget-backlight {
        background: alpha(@bg-darker, 0.7);
        border-radius: 20px;
        padding: 8px 16px;
        margin: 5px 10px;
        color: @fg;
        border: none;
      }

      .widget-volume label:first-child,
      .widget-backlight label:first-child {
        font-family: "Material Symbols Rounded", "Symbols Nerd Font", sans-serif;
        font-size: 1.2rem;
        margin-right: 8px;
        min-width: 24px;
        text-align: center;
      }

      .widget-volume > box > button,
      .widget-backlight > box > button {
        border: none;
        background-color: @bg;
        border-radius: 9999px;
        color: @fg;
        padding: 2px 6px;
        min-width: 0;
        min-height: 0;
        font-size: 0.868rem;
      }

      .widget-volume > box > button:hover,
      .widget-backlight > box > button:hover {
        background-color: alpha(@fg, 0.2);
      }

      .widget-volume scale trough,
      .widget-backlight scale trough {
        background: alpha(@fg, 0.2);
        border-radius: 20px;
        min-height: 8px;
        border: none;
      }

      .widget-volume scale highlight,
      .widget-backlight scale highlight {
        background: @accent;
        border-radius: 20px;
      }

      .widget-volume scale slider,
      .widget-backlight scale slider {
        background: @accent;
        border-radius: 9999px;
        border: none;
        min-height: 16px;
        min-width: 16px;
      }

      .widget-buttons-grid {
        border-radius: 20px;
        padding: 5px;
        margin: 5px 10px 10px 10px;
        background: alpha(@bg-darker, 0.7);
      }

      .widget-buttons-grid > flowbox > flowboxchild {
        background: transparent;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button {
        border: none;
        background-color: transparent;
        border-radius: 9999px;
        min-width: 60px;
        min-height: 2.5rem;
        padding: 0;
        margin: 0 2px;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button label {
        font-family: "Material Symbols Rounded";
        font-size: 1.3027rem;
        color: @fg;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button:hover {
        background: @accent;
        color: @bg;
      }

      .widget-buttons-grid > flowbox > flowboxchild:last-child > button {
        background: alpha(@red, 0.85);
        color: @bg;
      }

      .widget-buttons-grid > flowbox > flowboxchild:last-child > button label {
        color: @bg;
      }

      .widget-buttons-grid > flowbox > flowboxchild:last-child > button:hover {
        background: @red;
      }
    '';
  };
}
