{ config, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  services.swaync = {
    enable = true;

    settings = {
      positionX = "left";
      positionY = "top";
      control-center-position = "top-left";
      notification-position = "top-right";
      layer = "top";
      control-center-layer = "top";
      control-center-margin-top = 5;
      control-center-margin-bottom = 5;
      control-center-margin-right = 5;
      control-center-margin-left = 5;
      control-center-width = 400;
      control-center-height = 250;
      fit-to-screen = false;

      widgets = [ "mpris" ];

      widget-config = {
        mpris = {
          image-size = 130;
          image-radius = 12;
          blur = false;
          autohide = false;
        };
      };
    };

    style = ''
      @define-color bg #${colors.base00};
      @define-color fg #${colors.base05};
      @define-color border #${colors.base0E};

      .control-center {
        background: @bg;
        border: 2px solid @border;
        border-radius: 12px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.4);
      }

      .notification-row {
        background: @bg;
        border: 1px solid @border;
        border-radius: 12px;
        margin: 6px 0;
      }

      .mpris {
        background: transparent;
        padding: 12px;
      }

      .mpris .image {
        border-radius: 12px;
      }

      .mpris .title {
        font-size: 1.1em;
        font-weight: bold;
        color: @fg;
      }

      .mpris .artist {
        color: alpha(@fg, 0.7);
      }

      /* Прогресс-бар */
      .mpris .progress-bar {
        background: alpha(@fg, 0.2);
        border-radius: 6px;
        height: 6px;
        margin: 8px 0;
      }

      .mpris .progress-bar progress {
        background: @border;
        border-radius: 6px;
      }

      .mpris .buttons button {
        background: transparent;
        color: @fg;
        font-size: 20px;
        border: none;
        padding: 0 10px;
      }

      .mpris .buttons button:hover {
        color: @border;
      }
    '';
  };
}
