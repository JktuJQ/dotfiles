{ pkgs, config, ... }:
{
    programs.fish = {
        enable = true;
        plugins = [
            { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
            { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
            { name = "done"; src = pkgs.fishPlugins.done.src; }
            { name = "colored-man-pages"; src = pkgs.fishPlugins.colored-man-pages.src; }
        ];
        shellAliases = {
            df = "rgrc df";
            mount = "rgrc mount";
            ps = "rgrc ps aux";
            netstat = "rgrc netstat";
            ping = "rgrc ping";
            traceroute = "rgrc traceroute";
            diff = "rgrc diff";
            last = "rgrc last";
            ifconfig = "rgrc ifconfig";
            ip = "rgrc ip";
            du = "rgrc du";
            free = "rgrc free";
            uptime = "rgrc uptime";
            blkid = "rgrc blkid";
            curl = "rgrc curl";
            env = "rgrc env";
            fdisk = "rgrc fdisk";
            findmnt = "rgrc findmnt";
            gcc = "rgrc gcc";
            getfacl = "rgrc getfacl";
            id = "rgrc id";
            iptables = "rgrc iptables";
            journalctl = "rgrc journalctl --no-pager | less -R";
            lsattr = "rgrc lsattr";
            lsblk = "rgrc lsblk";
            lsmod = "rgrc lsmod";
            lspci = "rgrc lspci";
            sensors = "rgrc sensors";
            ss = "rgrc ss";
            stat = "rgrc stat";
            sysctl = "rgrc sysctl";
            systemctl = "rgrc systemctl";
            tail = "rgrc tail";
            tune2fs = "rgrc tune2fs";
            vmstat = "rgrc vmstat";
            go = "rgrc go";

            cd = "z";
            ls = "eza --icons --color=always --group-directories-first";
            tree = "eza --tree --icons --color=always --group-directories-first";
            cat = "bat --style=plain --paging=never";
            catp = "bat --style=plain --paging=always";
            grep = "rg";
            fdf = "fd --type f";
            fdd = "fd --type d";
            fzfr = "fzf --height 40% --border --reverse --preview 'bat --style=plain --color=always {}'";
        };
        interactiveShellInit = ''
            set fish_greeting
            fastfetch

            starship init fish | source

            zoxide init fish | source
            fzf_configure_bindings --directory=\ct --history=\cr --variables=\cv
        '';
    };

    home.sessionVariables.SHELL = "fish";
}
