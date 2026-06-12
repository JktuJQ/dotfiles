{ config, pkgs, lib, ... }:

{
    programs.starship = {
        enable = true;
        settings = {
            add_newline = true;
            scan_timeout = 10;
            format = ''
                $username$hostname$directory$git_branch$git_status$nix_shell$character
            '';
            username = {
                style_user = "bg:green fg:black";
                style_root = "bg:red fg:black";
                format = "[$user]($style) ";
                disabled = false;
                show_always = true;
            };
            hostname = {
                ssh_only = false;
                format = "at [$hostname](bg:blue fg:black) ";
                trim_at = ".local";
                disabled = false;
            };
            directory = {
                truncation_length = 3;
                truncation_symbol = "…/";
                style = "bg:cyan fg:black";
                format = "in [$path]($style) ";
                read_only = " 󰌾";
            };
            git_branch = {
                symbol = " ";
                style = "bg:magenta fg:black";
                format = "on [$symbol$branch]($style) ";
            };
            git_status = {
                style = "bg:yellow fg:black";
                format = "[$all_status$ahead_behind]($style) ";
                conflicted = "🏳️ ";
                ahead = "󰜧 ";
                behind = "󰴰 ";
                diverged = "󰜧󰴰 ";
                untracked = "󰜸 ";
                stashed = "󰏗 ";
                modified = "󰱩 ";
                staged = "[󰱣](bg:green fg:black) ";
                renamed = "󰰈 ";
                deleted = "󰊸 ";
            };
            nix_shell = {
                symbol = "󱄅 ";
                style = "bg:red fg:black";
                format = "via [$symbol]($style) ";
                heuristic = true;
                impure_msg = "";
                pure_msg = "";
            };
            character = {
                success_symbol = "[󰝤](bold green)";
                error_symbol = "[󰝩](bold red)";
                vicmd_symbol = "[](bold blue)";
                format = "$symbol ";
            };
        };
    };
}
