{ config, pkgs, lib, ... }:

{
    home.file.".config/fastfetch/config.jsonc".text = ''
        {
            "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
            "logo": {
                "source": "nixos_small",
                "color": "blue",
                "padding": {
                    "left": 2,
                    "right": 2
                }
            },
            "display": {
                "color": {
                    "keys": "blue",
                    "title": "cyan"
                },
                "separator": "  "
            },
            "modules": [
                "title",
                "separator",
                "os",
                "host",
                "kernel",
                "packages",
                "shell",
                "terminal",
                "de",
                "wm",
                "cpu",
                "gpu",
                "memory",
                "disk",
                "battery",
                "break",
                "localip",
                "publicip",
                "colors"
            ]
        }
    '';
}
