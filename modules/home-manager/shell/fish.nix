{ config, pkgs, lib, ... }:

{
    programs.fish = {
        enable = true;
        shellAliases = {
            ls = "grc --config=conf.ls ls --color=auto";
            ll = "grc --config=conf.ls ls -l --color=auto";
            la = "grc --config=conf.ls ls -la --color=auto";
            l = "grc --config=conf.ls ls -CF --color=auto";
            df = "grc df";
            mount = "grc mount";
            ps = "grc ps aux";
            netstat = "grc netstat";
            ping = "grc ping";
            traceroute = "grc traceroute";
            diff = "grc diff";
            last = "grc last";
            ifconfig = "grc ifconfig";
            ip = "grc ip";

            cat = "bat --style=plain --paging=never";
            tree = "eza --tree --icons --color=always --group-directories-first";
            rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos";
            update = "nix flake update --flake ~/dotfiles && rebuild";
        };
        interactiveShellInit = ''
            set fish_greeting
            fish_config theme show Catppuccin Mocha
            starship init fish | source
        '';
        plugins = [
            { name = "z"; src = pkgs.fishPlugins.z.src; }
            { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
            { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
            { name = "done"; src = pkgs.fishPlugins.done.src; }
            { name = "grc"; src = pkgs.fishPlugins.grc.src; }
            { name = "colored-man-pages"; src = pkgs.fishPlugins.colored-man-pages.src; }
        ];
    };
}
