{ pkgs, ... }:
{
    programs.alacritty = {
        enable = true;
        settings = {
            env.TERM = "xterm-256color";
            shell.program = "${pkgs.fish}/bin/fish";
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
                indexed_colors = [];
                draw_bold_text_with_bright_colors = true;
            };
        };
    };

    stylix.fonts.sizes.terminal = 18;
    stylix.opacity.terminal = 0.80;

    home.sessionVariables.TERMINAL = "alacritty";
}
