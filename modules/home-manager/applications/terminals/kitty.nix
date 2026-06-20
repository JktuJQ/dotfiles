{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      term = "xterm-256color";
      shell = config.home.sessionVariables.SHELL;
      window_padding_width = 10;
      hide_window_decorations = "yes";
      scrollback_lines = 10000;
      cursor_shape = "block";
      cursor_blink_interval = 0;
    };
  };

  home.sessionVariables.TERMINAL = "kitty";
}
