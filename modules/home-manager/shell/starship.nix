{ config, lib, ... }:
let
    colors = config.lib.stylix.colors;
in
{
    programs.starship = {
        enable = true;
        enableTransience = true;
        settings = {
            format = lib.concatStrings [
                "[╭─](fg:surface2)"
                "[](fg:surface1)"
                "$os"
                "[](bg:peach fg:surface1)"
                "$directory"
                "[](bg:yellow fg:peach)"
                "$git_branch"
                "$git_status"
                "[](fg:yellow bg:green)"
                "$c$rust$golang$nodejs$java$kotlin$haskell$python"
                "[](fg:green bg:sapphire)"
                "[](fg:sapphire bg:lavender)"
                "$time"
                "[](fg:lavender)"
                "$line_break"
                "[╰─](fg:surface2)"
                "$character"
            ];

            palette = "stylix";
            palettes = {
                stylix = {
                    peach   = "#${colors.base0D}";
                    yellow  = "#${colors.base0A}";
                    green   = "#${colors.base0B}";
                    sapphire = "#${colors.base0C}";
                    lavender = "#${colors.base0E}";
                    crust   = "#${colors.base00}";
                    surface2 = "#${colors.base02}";
                    surface1 = "#${colors.base01}";
                    surface0 = "#${colors.base00}";
                    text    = "#${colors.base05}";
                };
            };
            os = {
                disabled = false;
                style = "bg:surface1 fg:text";
                symbols = {
                    NixOS = " 󱄅  ";
                    Linux = " 󰌽  ";
                };
            };
            directory = {
                style = "bg:peach fg:crust";
                format = "[ $path ]($style)";
                truncation_length = 0;
                substitutions = {
                    "~" = "󰋞 ";
                };
            };
            git_branch = {
                symbol = "󰊢 ";
                style = "bg:yellow fg:crust";
                format = "[ $symbol$branch ]($style)";
            };
            git_status = {
                style = "bg:yellow fg:crust";
                format = "[($all_status$ahead_behind )]($style)";
            };
            nodejs = {
                symbol = " ";
                style = "bg:green";
                format = "[[ $symbol](fg:crust bg:green)]($style)";
            };
            c = {
                symbol = " ";
                style = "bg:green";
                format = "[[ $symbol](fg:crust bg:green)]($style)";
            };
            rust = {
                symbol = "󱘗 ";
                style = "bg:green";
                format = "[[ $symbol](fg:crust bg:green)]($style)";
            };
            golang = {
                symbol = "󰟓 ";
                style = "bg:green";
                format = "[[ $symbol](fg:crust bg:green)]($style)";
            };
            java = {
                symbol = " ";
                style = "bg:green";
                format = "[[ $symbol](fg:crust bg:green)]($style)";
            };
            kotlin = {
                symbol = " ";
                style = "bg:green";
                format = "[[ $symbol](fg:crust bg:green)]($style)";
            };
            haskell = {
                symbol = " ";
                style = "bg:green";
                format = "[[ $symbol](fg:crust bg:green)]($style)";
            };
            python = {
                symbol = " ";
                style = "bg:green";
                format = "[[ $symbol( $version)(\\(#$virtualenv\\)) ](fg:crust bg:green)]($style)";
            };
            time = {
                disabled = false;
                time_format = "%R";
                style = "bg:lavender";
                format = "[[ 󰅐 $time ](fg:crust bg:lavender)]($style)";
            };

            line_break.disabled = false;
            character = {
                success_symbol = "[❯](bold green)";
                error_symbol = "[❯](bold red)";
                vimcmd_symbol = "[❮](bold green)";
            };
        };
    };

    stylix.targets.starship.enable = false;
}
