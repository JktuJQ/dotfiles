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

      input-field = {
        size = "200, 60";
        position = "0, -150";
        dots_size = 0.2;
        dots_spacing = 0.5;
      };
    };
  };
}
