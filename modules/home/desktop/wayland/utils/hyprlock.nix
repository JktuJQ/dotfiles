{ config, ... }: let
  colors = config.lib.stylix.colors;
  font = config.stylix.fonts.monospace.name;
  wallpaper = config.stylix.image;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };

      background = {
        path = wallpaper;
        blur_passes = 5;
        blur_size = 5;
      };

      image = {
        path = "~/.face";
        size = 180;
        rounding = -1;
        border_size = 0;
        position = "0, 350";
        halign = "center";
        valign = "bottom";
      };

      label = [
        {
          text = "$USER";
          color = "rgb(${colors.base05})";
          font_size = 20;
          font_family = font;
          position = "0, 300";
          halign = "center";
          valign = "bottom";
        }
        {
          text = "cmd[update:1] date +\"%l:%M\"";
          color = "rgb(${colors.base05})";
          font_size = 120;
          font_family = "${font} black";
          position = "0, -200";
          halign = "center";
          valign = "top";
        }
        {
          text = "cmd[update:1] date +\"%a\"";
          color = "rgb(${colors.base05})";
          font_size = 16;
          font_family = font;
          position = "-150, -380";
          halign = "center";
          valign = "top";
        }
        {
          text = "";
          color = "rgb(${colors.base08})";
          font_size = 14;
          font_family = font;
          position = "-100, -382";
          halign = "center";
          valign = "top";
        }
        {
          text = "cmd[update:1] date +\"%e\"";
          color = "rgb(${colors.base05})";
          font_size = 16;
          font_family = font;
          position = "-50, -380";
          halign = "center";
          valign = "top";
        }
        {
          text = "";
          color = "rgb(${colors.base0B})";
          font_size = 14;
          font_family = font;
          position = "0, -382";
          halign = "center";
          valign = "top";
        }
        {
          text = "cmd[update:1000] date +\"%b\"";
          color = "rgb(${colors.base05})";
          font_size = 16;
          font_family = font;
          position = "50, -380";
          halign = "center";
          valign = "top";
        }
        {
          text = "";
          color = "rgb(${colors.base0D})";
          font_size = 14;
          font_family = font;
          position = "100, -382";
          halign = "center";
          valign = "top";
        }
        {
          text = "cmd[update:1000] date +\"%Y\"";
          color = "rgb(${colors.base05})";
          font_size = 16;
          font_family = font;
          position = "150, -380";
          halign = "center";
          valign = "top";
        }
      ];

      input-field = {
        size = "200, 30";
        outline_thickness = 0;
        inner_color = "rgba(0,0,0,0)";
        outer_color = "rgba(0,0,0,0)";
        font_color = "rgb(${colors.base05})";
        check_color = "rgb(${colors.base09})";
        fail_color = "rgb(${colors.base08})";
        fade_on_empty = false;
        rounding = 15;
        font_family = font;
        placeholder_text = "";
        fail_text = "";
        dots_size = 0.4;
        dots_spacing = 0.3;
        position = "0, 220";
        halign = "center";
        valign = "bottom";
      };
    };
  };

  stylix.targets.hyprlock.enable = false;
}
