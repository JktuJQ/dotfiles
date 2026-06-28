{ config, pkgs, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = false;
        no_fade_out = false;
        ignore_empty_input = true;
      };

      background = {
        blur_passes = 2;
        blur_size = 5;
      };

      input-field = {
        size = "200, 60";
        position = "0, -150";
        dots_size = 0.2;
        dots_spacing = 0.5;
        placeholder_text = ''<span foreground="##${colors.base04}">Type password...</span>'';
        fade_on_empty = true;
        fail_text = ''<span foreground="##${colors.base08}">$FAIL</span>'';
        fail_transition_duration = 200;
      };

      label = [
        {
          text = ''<span size="40000" weight="bold">$TIME</span>'';
          color = "rgb(${colors.base05})";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
