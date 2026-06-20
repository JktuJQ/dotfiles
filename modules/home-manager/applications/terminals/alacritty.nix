{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      shell.program = config.home.sessionVariables.SHELL;
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        dynamic_padding = true;
        decorations = "None";
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      cursor = {
        style = "Block";
        unfocused_hollow = true;
      };
      colors = {
        indexed_colors = [ ];
        draw_bold_text_with_bright_colors = true;
      };
    };
  };

  home.sessionVariables.TERMINAL = "alacritty";
}
