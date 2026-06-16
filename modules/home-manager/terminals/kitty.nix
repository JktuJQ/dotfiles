{ pkgs, ... }:
{
    programs.kitty = {
        enable = true;
        settings = {
            term = "xterm-256color";
            shell = "${pkgs.fish}/bin/fish";
            window_padding_width = 10;
            hide_window_decorations = "yes";
            scrollback_lines = 10000;
            cursor_shape = "block";
            cursor_blink_interval = 0;
        };
    };

    stylix.fonts.sizes.terminal = 18;
    stylix.opacity.terminal = 0.85;

    home.sessionVariables.TERMINAL = "kitty";
}
