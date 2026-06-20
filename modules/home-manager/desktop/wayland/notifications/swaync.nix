{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
  ];

  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "overlay";
      layer-shell = true;
      cssPriority = "user";
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-window-geometry = {
        width = 360;
        height = "auto";
      };
      control-center-geometry = {
        width = 420;
        height = "auto";
      };
      widgets = [
        "title"
        "dnd"
        "label"
        "mpris"
        "buttons-grid"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          text = "No notifications";
        };
        buttons-grid = {
          actions = [
            {
              label = "󰌾 Lock";
              command = "hyprlock";
            }
            {
              label = " Power";
              command = "wlogout";
            }
          ];
        };
        mpris = {
          image-size = 96;
          image-radius = 8;
        };
      };
    };
    style = ''
      * {
          all: unset;
      }

      .notification-row {
          padding: 8px;
          margin: 8px 0;
          border-radius: 12px;
          background-color: #${config.lib.stylix.colors.base00}dd;
          color: #${config.lib.stylix.colors.base05};
      }

      .notification-row:hover {
          background-color: #${config.lib.stylix.colors.base01}dd;
      }

      .notification-row .notification-content .summary {
          font-weight: bold;
          color: #${config.lib.stylix.colors.base0D};
      }

      .notification-row .notification-content .body {
          color: #${config.lib.stylix.colors.base05};
      }

      .notification-row .notification-content .app-name {
          color: #${config.lib.stylix.colors.base04};
      }

      .notification-row .notification-content .time {
          color: #${config.lib.stylix.colors.base03};
      }

      .notification-row .notification-actions {
          margin-top: 8px;
          border-top: 1px solid #${config.lib.stylix.colors.base02};
          padding-top: 8px;
      }

      .notification-row .notification-actions .action-button {
          background-color: #${config.lib.stylix.colors.base01};
          color: #${config.lib.stylix.colors.base05};
          padding: 4px 12px;
          border-radius: 8px;
          margin-right: 8px;
      }

      .notification-row .notification-actions .action-button:hover {
          background-color: #${config.lib.stylix.colors.base02};
      }

      .notification-row .close-button {
          background-color: #${config.lib.stylix.colors.base08};
          color: #${config.lib.stylix.colors.base00};
          border-radius: 8px;
          padding: 2px 8px;
      }

      .notification-row .close-button:hover {
          background-color: #${config.lib.stylix.colors.base12};
      }

      .notification-group .notification-group-header {
          color: #${config.lib.stylix.colors.base04};
          font-weight: bold;
          padding: 4px 0;
      }

      .notification-group .notification-group-header .count {
          color: #${config.lib.stylix.colors.base0D};
      }

      .control-center {
          background-color: #${config.lib.stylix.colors.base00}ee;
          color: #${config.lib.stylix.colors.base05};
          padding: 16px;
          border-radius: 16px;
          border: 1px solid #${config.lib.stylix.colors.base02};
      }

      .control-center .widget-title {
          color: #${config.lib.stylix.colors.base0D};
          font-weight: bold;
          padding: 8px 0;
      }

      .control-center .widget-title .button {
          background-color: #${config.lib.stylix.colors.base01};
          color: #${config.lib.stylix.colors.base05};
          padding: 4px 12px;
          border-radius: 8px;
      }

      .control-center .widget-title .button:hover {
          background-color: #${config.lib.stylix.colors.base02};
      }

      .control-center .widget-dnd {
          padding: 8px 0;
      }

      .control-center .widget-dnd .switch {
          background-color: #${config.lib.stylix.colors.base02};
          border-radius: 12px;
          width: 40px;
          height: 20px;
      }

      .control-center .widget-dnd .switch .slider {
          background-color: #${config.lib.stylix.colors.base05};
          border-radius: 12px;
          width: 16px;
          height: 16px;
          margin: 2px;
      }

      .control-center .widget-dnd .switch.on {
          background-color: #${config.lib.stylix.colors.base0D};
      }

      .control-center .widget-dnd .switch.on .slider {
          background-color: #${config.lib.stylix.colors.base00};
      }

      .control-center .widget-label {
          padding: 8px 0;
          color: #${config.lib.stylix.colors.base04};
      }

      .control-center .widget-buttons-grid {
          padding: 8px 0;
      }

      .control-center .widget-buttons-grid .button {
          background-color: #${config.lib.stylix.colors.base01};
          color: #${config.lib.stylix.colors.base05};
          padding: 8px 16px;
          border-radius: 8px;
          margin: 4px;
      }

      .control-center .widget-buttons-grid .button:hover {
          background-color: #${config.lib.stylix.colors.base02};
      }

      .control-center .widget-mpris {
          padding: 8px 0;
      }

      .control-center .widget-mpris .box {
          background-color: #${config.lib.stylix.colors.base01};
          border-radius: 8px;
          padding: 8px;
      }

      .control-center .widget-mpris .box .image {
          border-radius: 8px;
      }

      .control-center .widget-mpris .box .label {
          color: #${config.lib.stylix.colors.base05};
      }

      .control-center .widget-mpris .box .button {
          background-color: transparent;
          color: #${config.lib.stylix.colors.base05};
      }

      .control-center .widget-mpris .box .button:hover {
          color: #${config.lib.stylix.colors.base0D};
      }
    '';
  };

  stylix.targets.swaync.enable = false;
}
