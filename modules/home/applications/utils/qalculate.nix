{ pkgs, ... }:
{
  programs.qalculate = {
    enable = true;
    package = pkgs.qalculate-gtk;
    settings = {
      General = {
        colorize = 1;
        precision = 10;
        save_mode_on_exit = 1;
        save_definitions_on_exit = 0;
      };
      Mode = {
        angle_unit = 1;
        number_base = 10;
        calculate_as_you_type = 1;
        min_deci = 0;
        max_deci = -1;
      };
    };
  };
}
